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
                       minWidth = 200, footer = "Totals"),
  raw_reads = colDef(name = "input reads",  footer = function(values) sprintf("%.0f", sum(values)), filterable = FALSE),
  nochim = colDef(name = "final reads", footer = function(values) sprintf("%.0f", sum(values)), filterable = FALSE),
  year = colDef(name = "Year"),
  perc_remain = colDef(name = "per. reads remain", filterable = FALSE),
  total_asvs = colDef(name = "no. ASVs", filterable = FALSE)),
  searchable = TRUE, defaultPageSize = 5, 
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = FALSE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}

################################################################################

metadata_summary_table <-  function(seq_table) {
  reactable(seq_table,
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 1),
    align = "center", filterable = TRUE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold")
    ), 
  columns = list(
    category = colDef(name = "category", 
                       sticky = "left", 
                       style = list(borderRight = "1px solid #eee"),
                       headerStyle = list(borderRight = "1px solid #eee"), 
                       align = "left",
                       minWidth = 100),
  count = colDef(name = "no. samples")),
  searchable = TRUE, defaultPageSize = 5, 
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = FALSE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}
  ################################################################################

neg_control_check <-  function(seq_table) {
  reactable(seq_table,
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold")
    ), 
  columns = list(
    ASV_ID = colDef(name = "ASV ID", 
                       sticky = "left", 
                       style = list(borderRight = "1px solid #eee"),
                       headerStyle = list(borderRight = "1px solid #eee"), 
                       align = "left",
                       minWidth = 100),
  `reads NC` = colDef(name = "reads in NC"),
  `reads non NC` = colDef(name = "reads in non NC"),
   perc_in_neg = colDef(name = "% in NC"),
   `Num samp` = colDef(name = "no. samples"),
   `reads Y0 NC` = colDef(name = "Y0 NC reads"),
   `reads Y4 NC` = colDef(name = "Y4 NC reads")
  ),
  searchable = FALSE, defaultPageSize = 11, 
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = FALSE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = FALSE, 
  wrap = FALSE, showSortable = FALSE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}
  ################################################################################


seq_summary_final <-  function(seq_table) {
  reactable(seq_table,
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "center", filterable = TRUE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold")
    ), 
  columns = list(
    Sample_ID = colDef(name = "Sample ID", 
                       sticky = "left", 
                       style = list(borderRight = "1px solid #eee"),
                       headerStyle = list(borderRight = "1px solid #eee"), 
                       align = "left",
                       minWidth = 200, footer = "Totals"),
  total_reads = colDef(filterable = FALSE,  footer = function(values) sprintf("%.0f", sum(values))),
  total_ASVs = colDef(filterable = FALSE),
  reads_lost = colDef(filterable = FALSE,  footer = function(values) sprintf("%.0f", sum(values))),
  ASVs_lost = colDef(filterable = FALSE)
    ), 
  searchable = TRUE, defaultPageSize = 5, 
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = FALSE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}