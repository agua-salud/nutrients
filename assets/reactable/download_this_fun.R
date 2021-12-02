download_this_fun <- function(input_tab) {
  out_name <- deparse(substitute(input_tab))
  seq_table <<- input_tab
  seq_table %>%
  download_this(
    output_name = out_name,
    output_extension = ".csv",
    button_label = "Download data as csv file",
    button_type = "default",
    csv2 = FALSE,
    has_icon = TRUE,
    icon = "fa fa-save")
  }