filter_summary <-  function(seq_table) {
reactable(seq_table,
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold"), minWidth = 100
    ), 
  columns = list(
    Metric = colDef(name = "Metric", 
                       sticky = "left", 
                       style = list(borderRight = "1px solid #eee"),
                       headerStyle = list(borderRight = "1px solid #eee"), 
                       align = "left",
                       minWidth = 200)
    ), 
  searchable = FALSE, defaultPageSize = 10, showPagination = FALSE,
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = TRUE, 
  wrap = FALSE, showSortable = FALSE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}

################################################################################
filter_full_table <-  function(seq_table) {
reactable(seq_table,
    columns = list(
    Sample_ID = colDef(name = "Sample_ID", 
                       sticky = "left", 
                       style = list(borderRight = "5px solid #eee"),
                       headerStyle = list(borderRight = "5px solid #eee"), 
                       align = "left",
                       minWidth = 200),
    total_reads_full = colDef(name = "FULL", filterable = FALSE, 
                       style = list(borderLeft = "5px solid #eee"),
                       headerStyle = list(borderLeft = "5px solid #eee")),
    total_reads_filt = colDef(name = "Arbitrary", filterable = FALSE),
    total_reads_perfect = colDef(name = "PERFect", filterable = FALSE),
    total_reads_pime = colDef(name = "PIME", filterable = FALSE, 
                       style = list(borderRight = "5px solid #eee"),
                       headerStyle = list(borderRight = "5px solid #eee")),
    total_asvs_full = colDef(name = "FULL", filterable = FALSE),
    total_asvs_filt = colDef(name = "Arbitrary", filterable = FALSE),
    total_asvs_perfect = colDef(name = "PERFect", filterable = FALSE),
    total_asvs_pime = colDef(name = "PIME", filterable = FALSE)
  ),
  columnGroups = list(
    colGroup(name = "Sample Data", columns = c("LOC", "YEAR", "AGE", "TREAT"),
                       headerStyle = list(fontSize = "1em")),
    colGroup(name = "Total Reads", columns = c("total_reads_full", "total_reads_filt", "total_reads_perfect", "total_reads_pime"),
                       headerStyle = list(borderLeft = "5px solid #eee", fontSize = "1em", borderRight = "5px solid #eee")),
    colGroup(name = "Total ASVs", columns = c("total_asvs_full", "total_asvs_filt", "total_asvs_perfect", "total_asvs_pime"),
                       headerStyle = list(fontSize = "1em"))
  ),
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "center", filterable = TRUE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold"), minWidth = 100
    ), 
  searchable = TRUE, defaultPageSize = 5, showPagination = TRUE,
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = TRUE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}

################################################################################
filter_results_summ <-  function(seq_table) {
reactable(seq_table,
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold"), minWidth = 150
    ), 
  columns = list(
    Metric = colDef(name = "Metric", 
                       sticky = "left", 
                       style = list(borderRight = "1px solid #eee"),
                       headerStyle = list(borderRight = "1px solid #eee"), 
                       align = "left",
                       minWidth = 200)
    ), 
  searchable = FALSE, defaultPageSize = 10, showPagination = FALSE,
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = TRUE, 
  wrap = FALSE, showSortable = FALSE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}

################################################################################
filter_results_sample <-  function(seq_table) {
reactable(seq_table,
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "center", filterable = TRUE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold"), minWidth = 100
    ), 
  columns = list(
    Sample_ID = colDef(name = "Sample_ID", 
                       sticky = "left", 
                       style = list(borderRight = "1px solid #eee"),
                       headerStyle = list(borderRight = "1px solid #eee"), 
                       align = "left",
                       minWidth = 200),
     total_reads = colDef(name = "total reads", filterable = FALSE, minWidth = 140),
     total_asvs = colDef(name = "total asvs", filterable = FALSE, minWidth = 140)
    ), 
  searchable = TRUE, defaultPageSize = 5, showPagination = TRUE,
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = TRUE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))


}  
################################################################################

asv_checking <-  function(seq_table) {
reactable(seq_table,
    columns = list(
    data_set = colDef(name = "data_set", 
                       sticky = "left", 
                       style = list(borderRight = "5px solid #eee"),
                       headerStyle = list(borderRight = "5px solid #eee"), 
                       align = "left",
                       minWidth = 100),
    default_order = colDef(name = "original ASVs", headerStyle = list(fontSize = "0.8em")),
    default_order_after_pval = colDef(name = "ASVs after p-value filter", minWidth = 100,
                       style = list(borderRight = "5px solid #eee"),
                       headerStyle = list(borderRight = "5px solid #eee", fontSize = "0.8em")),
    decrease_order = colDef(name = "original ASVs", headerStyle = list(fontSize = "0.8em")),
    decrease_order_after_pval = colDef(name = "ASVs after p-value filter", minWidth = 100,
                       headerStyle = list(fontSize = "0.8em"))
  ),
  columnGroups = list(
    colGroup(name = "Default order", columns = c("default_order", "default_order_after_pval"),
                       headerStyle = list(fontSize = "1em", borderRight = "5px solid #eee")),
    colGroup(name = "Decreasing order", columns = c("decrease_order", "decrease_order_after_pval"),
                       headerStyle = list(fontSize = "1em"))
  ),
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold"), minWidth = 75
    ), 
  searchable = FALSE, defaultPageSize = 6, showPagination = FALSE,
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = TRUE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}
################################################################################
pime_oob_best_prev <-  function(seq_table) {
reactable(seq_table,
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 4),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold"), minWidth = 100
    ), 
  columns = list(
    Interval = colDef(name = "Interval", 
                       sticky = "left", 
                       style = list(borderRight = "1px solid #eee"),
                       headerStyle = list(borderRight = "1px solid #eee"), 
                       align = "left",
                       minWidth = 100),
    OTUs = colDef(name = "ASVs"),
    Nseqs = colDef(name = "no. reads")
    ), 
  searchable = FALSE, defaultPageSize = 19, showPagination = FALSE,
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = FALSE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = TRUE, 
  wrap = FALSE, showSortable = FALSE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))

}

################################################################################
pime_best_prev_summ <-  function(seq_table) {
reactable(seq_table,
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 4),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold"), minWidth = 100
    ), 
  columns = list(
    ASV_ID = colDef(name = "ASV ID", 
                       sticky = "left", 
                       style = list(borderRight = "1px solid #eee"),
                       headerStyle = list(borderRight = "1px solid #eee"), 
                       align = "left",
                       minWidth = 100, filterable = TRUE),
    Kingdom = colDef(align = "left", filterable = TRUE),
    Phylum = colDef(align = "left", filterable = TRUE, minWidth = 150),
    Class = colDef(align = "left", filterable = TRUE, minWidth = 150),
    Order = colDef(align = "left", filterable = TRUE, minWidth = 150),
    Family = colDef(align = "left", filterable = TRUE, minWidth = 150),
    Genus = colDef(align = "left", filterable = TRUE, minWidth = 150)
    ), 
  searchable = FALSE, defaultPageSize = 5, showPagination = TRUE,
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = TRUE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}

################################################################################
pime_changes_by_yr_treat <-  function(seq_table) {
reactable(seq_table,
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "center", filterable = FALSE, sortable = FALSE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold"), minWidth = 100
    ), 
  columns = list(
    Description = colDef(name = "Description", 
                       sticky = "left", 
                       style = list(borderRight = "1px solid #eee"),
                       headerStyle = list(borderRight = "1px solid #eee"), 
                       align = "left",
                       minWidth = 150)
    ), 
  searchable = FALSE, defaultPageSize = 15, showPagination = FALSE,
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = TRUE, 
  wrap = FALSE, showSortable = FALSE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}

################################################################################
## THIS IS NOT A REACTABLE FUNCTION but simpler to include here...
compare_filter_to_original <-  function(sample_list, filter_meth = c("arbitrary", "perfect", "pime"), dataset = c("ssu", "its")) {
    tmp_total_reads <- c()
    for (i in tmp_samples) {
       tmp_get <- sum(readcount(get(i)))
       tmp_total_reads <- c(append(tmp_total_reads, tmp_get))
    }
    tmp_min_read <- c()
    for (i in tmp_samples) {
       tmp_get <- min(readcount(get(i)))
       tmp_min_read <- c(append(tmp_min_read, tmp_get))
    }
    tmp_max_read <- c()
    for (i in tmp_samples) {
       tmp_get <- max(readcount(get(i)))
       tmp_max_read <- c(append(tmp_max_read, tmp_get))
    }
    tmp_mean_reads <- c()
    for (i in tmp_samples) {
       tmp_get <- round(mean(readcount(get(i))), digits = 0)
       tmp_mean_reads <- c(append(tmp_mean_reads, tmp_get))
    }
    tmp_median_reads <- c()
    for (i in tmp_samples) {
       tmp_get <- median(readcount(get(i)))
       tmp_median_reads <- c(append(tmp_median_reads, tmp_get))
    }
    tmp_total_asvs <- c()
    for (i in tmp_samples) {
       tmp_get <- ntaxa(get(i))
       tmp_total_asvs <- c(append(tmp_total_asvs, tmp_get))
    }
    tmp_min_asvs <- c()
    for (i in tmp_samples) {
       tmp_get <- min(richness(get(i), index = "observed"))
       tmp_min_asvs <- c(append(tmp_min_asvs, tmp_get))
    }
    tmp_max_asvs <- c()
    for (i in tmp_samples) {
       tmp_get <- max(richness(get(i), index = "observed"))
       tmp_max_asvs <- c(append(tmp_max_asvs, tmp_get))
    }
    tmp_mean_asvs <- c()
    for (i in tmp_samples) {
       tmp_get <- round(mean(richness(get(i), index = "observed")$observed), digits = 0)
       tmp_mean_asvs <- c(append(tmp_mean_asvs, tmp_get))
    }
    tmp_med_asvs <- c()
    for (i in tmp_samples) {
       tmp_get <- median(richness(get(i), index = "observed")$observed)
       tmp_med_asvs <- c(append(tmp_med_asvs, tmp_get))
    }
    
    tmp_bind <- data.frame(do.call("rbind", list(
      tmp_total_reads, tmp_min_read, tmp_max_read, tmp_mean_reads, tmp_median_reads, 
      tmp_total_asvs, tmp_min_asvs, tmp_max_asvs, tmp_mean_asvs, tmp_med_asvs)))
    
  tmp_name <- paste(dataset,  "_sum_", filter_meth, sep = "")
  assign(tmp_name, tmp_bind, envir = parent.frame())
}