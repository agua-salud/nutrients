### This function combines the results of the Shapiro-Wilk Normality and Bartlett tests
### Takes the alpha diversity table as input
combo_tests <-  function(alpha_div_tab) {
  combo_deparse <- deparse(substitute(alpha_div_tab))
  combo_year <- gsub(".*_", "", combo_deparse)
  combo_results <- c()
  for (i in colnames(alpha_div_tab[,9:ncol(alpha_div_tab)])) {
     tmp_get_shap <- get(purrr::map_chr(i, ~ paste0("ssu_shap_", combo_year, "_", .)))
     tmp_shap_p <- round(tmp_get_shap[[2]], 4)
     tmp_get_bart <- get(purrr::map_chr(i, ~ paste0("ssu_bart_", combo_year, "_", .)))
     tmp_bart_p <- round(tmp_get_bart[[3]], 4)
     tmp_test <- if(tmp_shap_p > 0.05 & tmp_bart_p > 0.05 ){
          tmp_test <- "ANOVA"
        } else {
          tmp_test <- "Kruskal-Wallis"
        }
     tmp_df <- data.frame(i, tmp_shap_p, tmp_bart_p, tmp_test)
     combo_results <- dplyr::bind_rows(combo_results, tmp_df)
     
     rm(list = ls(pattern = "tmp_"))
  }
  combo_results[,1] <- gsub('_exp', '', combo_results[,1])
  combo_results <- combo_results %>% separate(col = 1, 
                                                into = c("metric", "dataset"), 
                                                sep = "_", remove = TRUE)
  combo_results <- combo_results %>% tidyr::replace_na(list(dataset = "FULL"))
  combo_results$dataset <- stringr::str_replace(combo_results$dataset, "^fi$", "FILT") %>%
                           stringr::str_replace(., "^pi$", "PIME") %>%
                           stringr::str_replace(., "^pe$", "PERFect")

  combo_results <- combo_results %>% 
    dplyr::rename(c("p-value (normality)" = 3, "p-value (homogeneity)" = 4, "method" = 5))
  
  norm_res_name <- paste0("ssu_norm_res_", combo_year)
  cat("object saved as ", norm_res_name)
  assign(norm_res_name, combo_results, envir = parent.frame() )
}
########################################################################################
### This function summarizes the results of post-hoc analysis
### Takes a ps object and q-value as input

ph_summ <-  function(ps_object, qvalue) {
  tmp_adt <- paste0(ps_object, "_q", qvalue, "_adt", sep =  "")
  tmp_get <- get(tmp_adt)
  tmp_marker <- stringr::str_extract(tmp_adt, "^[a-z]{3}") 
  tmp_ds <- stringr::str_extract(tmp_adt, "ps_[a-z]*_Y") %>%
                stringr::str_remove(., "ps_") %>%
                stringr::str_remove(., "_Y")
  tmp_year <- stringr::str_extract(tmp_adt, "Y[0-9]") 
  tmp_hill_n <- stringr::str_extract(tmp_adt, "_q[0-9]") %>%
                stringr::str_remove(., "_q")
  
  if (tmp_ds == "work"){
    #tmp_id <- "f"
    tmp_lab1 <- "FULL"
  } else if (tmp_ds == "filt") {
    #tmp_id <- "l"
    tmp_lab1 <- "Arbitrary"
  } else if (tmp_ds == "perfect") {
    #tmp_id <- "r"    
    tmp_lab1 <- "PERFect"
  } else if (tmp_ds == "pime") {
    #tmp_id <- "p"    
    tmp_lab1 <- "PIME"
  }

  if (tmp_hill_n == "0"){
    tmp_lab2 <- "Observed"
  } else if (tmp_hill_n == "1") {
    tmp_lab2 <- "Shannon exponential"    
  } else if (tmp_hill_n == "2") {
    tmp_lab2 <- "Inverse Simpson"    
  } 
  
  #tmp_name <- paste(tmp_marker, "_", tmp_year, "_", tmp_id, tmp_hill_n, "_lab", sep = "")
  tmp_name <- paste(ps_object, "_q", tmp_hill_n, "_lab", sep = "")
  tmp_lab <- paste(tmp_year, " ",  tmp_lab1, " ", "(", tmp_lab2, ")",sep = "")
  assign(tmp_name, tmp_lab, envir = parent.frame() )
  return(list(tmp_lab, tmp_get$posthoc.method, data.frame(tmp_get$posthoc)))
  rm(list = ls(pattern = "tmp_"))
}
########################################################################################
### This function is meant to rescale the y-axis of the alpha div plots so they are all
### the same. In prcatice it does not work very well when combined with display of post-
### hoc results. I ended up needing to manually fix many of the plots :/
### akes the name (in quotes) of a ps_object and the name (in quotes) of the q-value as input

## Rescale y axis to be the  same. 
jjs_scale_alph_div_plots <-  function(ps_object, qvalue) {
### GET PLOTS  
  sub_scale <- stringr::str_subset(scale_plots, ps_object)
  sub_scale <- stringr::str_subset(sub_scale, qvalue)
  tmp_scale <- sub_scale
  scale_plot_list <- lapply(tmp_scale, get)
  names(scale_plot_list) <- tmp_scale
### GET POSTHOC TESTS & P-VALUES  
  sub_adt <- stringr::str_remove(sub_scale, "_plot")
  tmp_adt <- sub_adt
  tmp_pvals <- c()
  for (i in tmp_adt) {
    tmp_get <- get(i)
    if (tmp_get$posthoc.method == "Tukey post-hoc test") {
      tmp_pval <- tmp_get$posthoc[, 4]
      tmp_pval <- sum(tmp_pval < 0.05)
    } else if (tmp_get$posthoc.method == "Dunn test with Benjamini-Hochberg correction") {
      tmp_pval <- tmp_get$posthoc$P.adj
      tmp_pval <- sum(tmp_pval < 0.05)
    }
    tmp_pvals <- c(append(tmp_pvals, tmp_pval))
  }
  num_sig_p  <- max(tmp_pvals)
  num_sig_0  <- 0.05
  num_sig_2  <- 0.2
  num_sig_3  <- 0.3

  ### CHANGE min and max y axis values for all plots based on num sig p-values
  if(num_sig_p == 0) {
      ymin <- min(sapply(scale_plot_list, function(x) min(x$data$Value) - 0.05 * min(x$data$Value) ))
      ymax <- max(sapply(scale_plot_list, function(x) max(x$data$Value) + num_sig_0 * max(x$data$Value) ))
      cat(num_sig_p, "p-values were < 0.05", "\n")
      cat("So the minimum & maximum values of the y-axis have been adjusted by ", num_sig_0, "\n")  
      cat("The minimum value has been set to", ymin, "and the maximum value is set to", ymax,   "\n")
  } else if (num_sig_p > 0 & num_sig_p <= 2) {
      ymin <- min(sapply(scale_plot_list, function(x) min(x$data$Value) - 0.05 * min(x$data$Value) ))
      ymax <- max(sapply(scale_plot_list, function(x) max(x$data$Value) + num_sig_2 * max(x$data$Value) ))
      cat(num_sig_p, "p-values were < 0.05", "\n")
      cat("So the minimum & maximum values of the y-axis have been adjusted by ", num_sig_2, "\n")  
      cat("The minimum value has been set to", ymin, "and the maximum value is set to", ymax,   "\n")
  } else if (num_sig_p > 2) {
      ymin <- min(sapply(scale_plot_list, function(x) min(x$data$Value) - 0.05 * min(x$data$Value) ))
      ymax <- max(sapply(scale_plot_list, function(x) max(x$data$Value) + num_sig_3 * max(x$data$Value) ))
      cat(num_sig_p, "p-values were < 0.05", "\n")
      cat("So the minimum & maximum values of the y-axis have been adjusted by ", num_sig_3, "\n")  
      cat("The minimum value has been set to", ymin, "and the maximum value is set to", ymax,   "\n")
      }
  ### Add new lims
  scale_plot_list_fix <- lapply(scale_plot_list, function(x) x + ylim(ymin, ymax))
  list2env(scale_plot_list_fix, envir = parent.frame())
}
########################################################################################
### This function combines the alpha div plots
### Takes the name (in quotes) of a ps_object as input

combo_alph_div_plots <-  function(ps_object) {
  sub_plot_list <- stringr::str_subset(plot_list, ps_object)
  sub_lab_list <- stringr::str_subset(lab_list, ps_object)
  
  tmp_marker <- stringr::str_extract(ps_object, "^[a-z]{3}") 
  tmp_ds <- stringr::str_remove(ps_object, ".*_") 

  tmp_adt <- sub_plot_list
  tmp_plot <- lapply(tmp_adt, get)
  names(tmp_plot) <- tmp_adt
  
  tmp_labs <- sub_lab_list
  tmp_lab_list <- lapply(tmp_labs, get)
  names(tmp_lab_list) <- tmp_adt
  tmp_plot[[1]] <- tmp_plot[[1]] + ggtitle(tmp_lab_list[[1]]) + 
                  theme(axis.title.x = element_blank(), 
                        axis.text.x = element_blank())
  tmp_plot[[4]] <- tmp_plot[[4]] + ggtitle(tmp_lab_list[[4]]) + 
                  theme(axis.title.y = element_blank(), 
                        axis.title.x = element_blank(), 
                        axis.text.x = element_blank())
  tmp_plot[[7]] <- tmp_plot[[7]] + ggtitle(tmp_lab_list[[7]]) + 
                  theme(axis.title.y = element_blank(), 
                        axis.title.x = element_blank(), 
                        axis.text.x = element_blank())
  tmp_plot[[2]] <- tmp_plot[[2]] + ggtitle(tmp_lab_list[[2]]) + 
                  theme(axis.title.x = element_blank(), 
                        axis.text.x = element_blank())
  tmp_plot[[5]] <- tmp_plot[[5]] + ggtitle(tmp_lab_list[[5]]) + 
                  theme(axis.title.y = element_blank(), 
                        axis.title.x = element_blank(), 
                        axis.text.x = element_blank())
  tmp_plot[[8]] <- tmp_plot[[8]] + ggtitle(tmp_lab_list[[8]]) + 
                  theme(axis.title.y = element_blank(), 
                        axis.title.x = element_blank(), 
                        axis.text.x = element_blank())
  tmp_plot[[3]] <- tmp_plot[[3]] + ggtitle(tmp_lab_list[[3]]) 
  tmp_plot[[6]] <- tmp_plot[[6]] + ggtitle(tmp_lab_list[[6]]) + 
                  theme(axis.title.y = element_blank()) 
  tmp_plot[[9]] <- tmp_plot[[9]] + ggtitle(tmp_lab_list[[9]]) + 
                  theme(axis.title.y = element_blank())  

  tmp_name <- paste(tmp_marker, "alph_div_plots", tmp_ds, sep =  "_")
  #tmp_leg <- get_legend(tmp_plot[[1]])
  tmp_alph_div_plots <- ggpubr::ggarrange(
    tmp_plot[[1]], # 1 > 1
    tmp_plot[[4]], # 2 > 4
    tmp_plot[[7]], # 3 > 7
    tmp_plot[[2]], # 4 > 2
    tmp_plot[[5]], # 5 > 5
    tmp_plot[[8]], # 6 > 8
    tmp_plot[[3]], # 7 > 3
    tmp_plot[[6]], # 8 > 6
    tmp_plot[[9]], # 9 > 9
    ncol = 3, nrow = 3, common.legend = TRUE, legend = "bottom"
    )
  assign(tmp_name, tmp_alph_div_plots, envir = parent.frame() )
}  
########################################################################################








########################################################################################
### This function is meant to rescale the y-axis of the alpha jitter plots so they are all
### the same. 

scale_alph_div_jitter_plots <-  function(ps_object, qvalue) {
### GET PLOTS  
  sub_scale <- stringr::str_subset(scale_plots, ps_object)
  sub_scale <- stringr::str_subset(sub_scale, qvalue)
  tmp_scale <- sub_scale
  scale_plot_list <- lapply(tmp_scale, get)
  names(scale_plot_list) <- tmp_scale
  adj_val <- 0.05
  ymin <- min(sapply(scale_plot_list, function(x) min(x$data$Value) - adj_val * min(x$data$Value) ))
  ymax <- max(sapply(scale_plot_list, function(x) max(x$data$Value) +adj_val * max(x$data$Value) ))
  cat("For the data  set", ps_object," with the q-value of", qvalue, "\n")
  cat("The minimum & maximum values of the y-axis have been adjusted by ", adj_val, "\n")  
  cat("The minimum value has been set to", ymin, "and the maximum value is set to", ymax,   "\n")

  ### Add new lims
  scale_plot_list_fix <- lapply(scale_plot_list, function(x) x + ylim(ymin, ymax))
  list2env(scale_plot_list_fix, envir = parent.frame())
}

########################################################################################
### This function combines the alpha div plots
### Takes the name (in quotes) of a ps_object as input

combo_alph_jitter_plots <-  function(ps_object) {
  sub_jitter_list <- stringr::str_subset(jitter_list, ps_object)
  sub_lab_list <- stringr::str_subset(lab_list, ps_object)
  
  tmp_marker <- stringr::str_extract(ps_object, "^[a-z]{3}") 
  tmp_ds <- stringr::str_remove(ps_object, ".*_") 

  tmp_adt <- sub_jitter_list
  tmp_plot <- lapply(tmp_adt, get)
  names(tmp_plot) <- tmp_adt
  
  tmp_labs <- sub_lab_list
  tmp_lab_list <- lapply(tmp_labs, get)
  names(tmp_lab_list) <- tmp_adt
  tmp_plot[[1]] <- tmp_plot[[1]] + ggtitle(tmp_lab_list[[1]]) + 
                  theme(axis.title.x = element_blank(), 
                        axis.text.x = element_blank())
  tmp_plot[[4]] <- tmp_plot[[4]] + ggtitle(tmp_lab_list[[4]]) + 
                  theme(axis.title.y = element_blank(), 
                        axis.title.x = element_blank(), 
                        axis.text.x = element_blank())
  tmp_plot[[7]] <- tmp_plot[[7]] + ggtitle(tmp_lab_list[[7]]) + 
                  theme(axis.title.y = element_blank(), 
                        axis.title.x = element_blank(), 
                        axis.text.x = element_blank())
  tmp_plot[[2]] <- tmp_plot[[2]] + ggtitle(tmp_lab_list[[2]]) + 
                  theme(axis.title.x = element_blank(), 
                        axis.text.x = element_blank())
  tmp_plot[[5]] <- tmp_plot[[5]] + ggtitle(tmp_lab_list[[5]]) + 
                  theme(axis.title.y = element_blank(), 
                        axis.title.x = element_blank(), 
                        axis.text.x = element_blank())
  tmp_plot[[8]] <- tmp_plot[[8]] + ggtitle(tmp_lab_list[[8]]) + 
                  theme(axis.title.y = element_blank(), 
                        axis.title.x = element_blank(), 
                        axis.text.x = element_blank())
  tmp_plot[[3]] <- tmp_plot[[3]] + ggtitle(tmp_lab_list[[3]]) 
  tmp_plot[[6]] <- tmp_plot[[6]] + ggtitle(tmp_lab_list[[6]]) + 
                  theme(axis.title.y = element_blank()) 
  tmp_plot[[9]] <- tmp_plot[[9]] + ggtitle(tmp_lab_list[[9]]) + 
                  theme(axis.title.y = element_blank())  

  tmp_name <- paste(tmp_marker, "alpha_jitter_plots", tmp_ds, sep =  "_")
  #tmp_leg <- get_legend(tmp_plot[[1]])
  tmp_alpha_jitter_plots <- ggpubr::ggarrange(
    tmp_plot[[1]], # 1 > 1
    tmp_plot[[4]], # 2 > 4
    tmp_plot[[7]], # 3 > 7
    tmp_plot[[2]], # 4 > 2
    tmp_plot[[5]], # 5 > 5
    tmp_plot[[8]], # 6 > 8
    tmp_plot[[3]], # 7 > 3
    tmp_plot[[6]], # 8 > 6
    tmp_plot[[9]], # 9 > 9
    ncol = 3, nrow = 3, common.legend = TRUE, legend = "bottom"
    )
  assign(tmp_name, tmp_alpha_jitter_plots, envir = parent.frame() )
}  
########################################################################################
