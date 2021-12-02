beta_disp_summ_table <-  function(seq_table)  {
  reactable(seq_table,
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 4),
    align = "center", filterable = TRUE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold"), minWidth = 75, headerVAlign = "center"
    ), 
  columns = list(
    dataset = colDef(name = "Dataset", 
                       sticky = "left", 
                       style = list(borderRight = "1px solid #eee"),
                       headerStyle = list(borderRight = "1px solid #eee"), 
                       align = "left",
                       minWidth = 75),
    dist = colDef(name = "distance", align = "left", minWidth = 150),
    `pval` = colDef(name = "p-value", resizable = FALSE,  filterable = FALSE, 
                                   style = pval_style)
    ), 
  searchable = FALSE, defaultPageSize = 12, showPagination = TRUE,
  pageSizeOptions = c(4, 12, 24, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = TRUE, 
  wrap = TRUE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}
################################################################################

sig_test_summary <-  function(seq_table) {
  reactable(seq_table,
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 3),
    align = "center", filterable = FALSE, sortable = FALSE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold"), minWidth = 100, headerVAlign = "center"
    ), 
  columns = list(
    distance = colDef(name = "Distance metric", 
                       sticky = "left", 
                       style = list(borderRight = "1px solid #eee"),
                       headerStyle = list(borderRight = "1px solid #eee"), 
                       align = "left",
                       minWidth = 200),
    `Year 0` = colDef(style = pval_style),
    `Year 1` = colDef(style = pval_style),
    `Year 4` = colDef(style = pval_style)
    ),
  columnGroups = list(colGroup(name = "p-values", columns = c("Year 0", "Year 1", "Year 4"),
                       headerStyle = list(fontSize = "1.3em"))
    ),
  searchable = FALSE, defaultPageSize = 12, showPagination = FALSE,
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = FALSE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = TRUE, 
  wrap = TRUE, showSortable = FALSE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.9em")))
}

