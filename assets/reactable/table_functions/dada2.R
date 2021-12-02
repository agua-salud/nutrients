sample_summary_table <-  function(seq_table) {
  reactable(seq_table,
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 1),
    align = "center", filterable = TRUE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold")
    ), 
  columns = list(
    Sample_ID = colDef(name = "Sample ID", 
                       sticky = "left", 
                       style = list(borderRight = "1px solid #eee"),
                       headerStyle = list(borderRight = "1px solid #eee"), 
                       align = "left",
                       minWidth = 150, footer = "Total reads"), 
    raw_reads = colDef(footer = function(values) sprintf("%.0f", sum(values)), 
                       filterable = FALSE)
    ), 
  searchable = TRUE, defaultPageSize = 5, 
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = FALSE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}

################################################################################

cutadapt_table <-  function(seq_table) {
reactable(seq_table,
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 1),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold")
    ), 
  columns = list(
    Sample_ID = colDef(name = "Sample ID", 
                       sticky = "left", 
                       style = list(borderRight = "1px solid #eee"),
                       headerStyle = list(borderRight = "1px solid #eee"), 
                       align = "left",
                       minWidth = 150, footer = "Total reads", filterable = TRUE), 
    raw_reads = colDef(footer = function(values) sprintf("%.0f", sum(values))),
    pre_filt_reads = colDef(footer = function(values) sprintf("%.0f", sum(values))),
    cutadapt_reads = colDef(footer = function(values) sprintf("%.0f", sum(values)))
    ), 
  searchable = FALSE, defaultPageSize = 5, 
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = FALSE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}  

################################################################################

filter_summary_table <-  function(seq_table) {
  reactable(seq_table,
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 1),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold")
    ), 
  columns = list(
    Sample_ID = colDef(name = "Sample ID", 
                       sticky = "left", 
                       style = list(borderRight = "1px solid #eee"),
                       headerStyle = list(borderRight = "1px solid #eee"), 
                       align = "left",
                       minWidth = 150, footer = "Total reads", filterable = TRUE), 
    reads_in = colDef(footer = function(values) sprintf("%.0f", sum(values))),
    reads_out = colDef(footer = function(values) sprintf("%.0f", sum(values)))
    ), 
  searchable = FALSE, defaultPageSize = 5, 
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = FALSE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}  
################################################################################

denoise_summary_table <-  function(seq_table) {
  reactable(seq_table,
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 1),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold")
    ), 
  columns = list(
    Sample_ID = colDef(name = "Sample ID", 
                       sticky = "left", 
                       style = list(borderRight = "1px solid #eee"),
                       headerStyle = list(borderRight = "1px solid #eee"), 
                       align = "left",
                       minWidth = 150, footer = "Total reads", filterable = TRUE), 
    denoiseF = colDef(footer = function(values) sprintf("%.0f", sum(values))),
    denoiseR = colDef(footer = function(values) sprintf("%.0f", sum(values)))
    ), 
  searchable = FALSE, defaultPageSize = 5, 
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = FALSE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}  
################################################################################

merge_summary_table <-  function(seq_table) {
  reactable(seq_table,
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 1),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold")
    ), 
  columns = list(
    Sample_ID = colDef(name = "Sample ID", 
                       sticky = "left", 
                       style = list(borderRight = "1px solid #eee"),
                       headerStyle = list(borderRight = "1px solid #eee"), 
                       align = "left",
                       minWidth = 150, footer = "Total reads", filterable = TRUE), 
    denoiseF = colDef(footer = function(values) sprintf("%.0f", sum(values))),
    denoiseR = colDef(footer = function(values) sprintf("%.0f", sum(values))),
    merged = colDef(footer = function(values) sprintf("%.0f", sum(values)))
    ), 
  searchable = FALSE, defaultPageSize = 5, 
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = FALSE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}
################################################################################

track_read_changes <-  function(seq_table) {
  reactable(seq_table,
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 1),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold")
    ), 
  columns = list(
    Sample_ID = colDef(name = "Sample ID", 
                       sticky = "left", 
                       style = list(borderRight = "1px solid #eee"),
                       headerStyle = list(borderRight = "1px solid #eee"), 
                       align = "left",
                       minWidth = 150, footer = "Total reads", filterable = TRUE), 
    year = colDef(filterable = TRUE),
    raw = colDef(footer = function(values) sprintf("%.0f", sum(values))),
    cut = colDef(footer = function(values) sprintf("%.0f", sum(values))),
    filter = colDef(footer = function(values) sprintf("%.0f", sum(values))),
    denoiseF = colDef(footer = function(values) sprintf("%.0f", sum(values))),
    denoiseR = colDef(footer = function(values) sprintf("%.0f", sum(values))),
    merged = colDef(footer = function(values) sprintf("%.0f", sum(values))),
    nochim = colDef(footer = function(values) sprintf("%.0f", sum(values)))
    ), 
  searchable = FALSE, defaultPageSize = 5, 
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = FALSE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}  
################################################################################

################################################################################
