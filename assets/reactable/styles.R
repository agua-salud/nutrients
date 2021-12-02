####################################
###### DEFINE     ##################
###### Table Styles ################
####################################
border_style <- list(borderRight = "5px solid #eee")
header_style <- list(borderRight = "5px solid #eee", fontSize = "0.9em")
header_style_grp <- list(borderRight = "5px solid #eee", fontSize = "1em")
per_cell <- function(value) format(value, digits = 3, scientific = FALSE)

####################################
###### DEFINE     ##################
###### P-value Styles ##############
####################################
pval_style <- function(value) {
                if (value > 0.05) {
                  color <- "#2271B2" #green
                } else if (value < 0.05) {
                  color <- "#B22271" #RED "#", "#"
                } else {
                  color <- "#777"
                }
                list(color = color, fontWeight = "bold")
} 
pval_style_border <- function(value) {
                if (value > 0.05) {
                  color <- "#2271B2" #green
                } else if (value < 0.05) {
                  color <- "#B22271" #RED "#", "#"
                } else {
                  color <- "#777"
                }
                list(color = color, fontWeight = "bold", borderRight = "5px solid #eee")
} 

pval_cell <- function(value) format(value, digits = 3, scientific = TRUE)



####################################
###### DEFINE     ##################
###### NA styles      ##############
####################################

na_style <- function(value) {
                if (is.na(value)) {
                  color <- "#D0D0D0"
                } else {
                  color <- "#000000CC"
                }
                list(color = color)
} 

na_border_style <- function(value) {
                if (is.na(value)) {
                  color <- "#D0D0D0"
                } else {
                  color <- "#000000CC"
                }
                list(color = color, borderRight = "5px solid #eee")
} 

