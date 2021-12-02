ds_summ_table <-  function(seq_table) 
  {reactable(seq_table,
    columns = list(
    Description = colDef(
                       style = border_style,
                       headerStyle = header_style, 
                       align = "left",
                       minWidth = 150, filterable = TRUE),
    `object name` = colDef(align = "left"),
    `no. samples` = colDef(filterable = FALSE),
    `total reads` = colDef(filterable = FALSE),
    `total asvs` = colDef(filterable = FALSE)
  ),
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "center", filterable = TRUE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold"), minWidth = 100
    ), 
  searchable = TRUE, defaultPageSize = 16, showPagination = FALSE,
  pageSizeOptions = c(5, 10, 50, nrow(seq_table)), 
  showPageSizeOptions = FALSE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = TRUE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}  
################################################################################

hill_table <-  function(seq_table) {reactable(seq_table,
    columns = list(
    Sample_ID = colDef(name = "Sample_ID", 
                       sticky = "left", 
                       style = border_style,
                       headerStyle = header_style, 
                       align = "left",
                       minWidth = 200, filterable = TRUE),
    LOC = colDef(filterable = TRUE),
    YEAR = colDef(filterable = TRUE),
    AGE = colDef(filterable = TRUE),
    TREAT = colDef(filterable = TRUE),
    YR_TREAT = colDef(name = "YR_TREAT", filterable = TRUE, 
                       style = border_style, headerStyle = header_style),
    Observed = colDef(name = "FULL"),
    Observed_fi = colDef(name = "Arbitrary"),
    Observed_pe = colDef(name = "PERFect"),
    Observed_pi = colDef(name = "PIME", 
                       style = border_style, headerStyle = header_style),
    Shannon_exp = colDef(name = "FULL"),
    Shannon_exp_fi = colDef(name = "Arbitrary"),
    Shannon_exp_pe = colDef(name = "PERFect"),
    Shannon_exp_pi = colDef(name = "PIME", 
                       style = border_style, headerStyle = header_style),
    InvSimpson = colDef(name = "FULL"),
    InvSimpson_fi = colDef(name = "Arbitrary"),
    InvSimpson_pe = colDef(name = "PERFect"),
    InvSimpson_pi = colDef(name = "PIME")
  ),
  columnGroups = list(
    colGroup(name = "Sample Data", 
             columns = c("LOC", "YEAR", "AGE", "TREAT", "YR_TREAT"),
                       headerStyle = header_style_grp),
    colGroup(name = "Observed richness", 
             columns = c("Observed", "Observed_fi", "Observed_pe", "Observed_pi"),
                       headerStyle = header_style_grp),
    colGroup(name = "Shannon exponential", 
             columns = c("Shannon_exp", "Shannon_exp_fi", "Shannon_exp_pe", "Shannon_exp_pi"),
                       headerStyle = header_style_grp),
    colGroup(name = "Simpson multiplicative inverse", 
             columns = c("InvSimpson", "InvSimpson_fi", "InvSimpson_pe", "InvSimpson_pi"),
                       headerStyle = list(fontSize = "1.1em"))
  ),
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold"), minWidth = 100
    ), 
  searchable = TRUE, defaultPageSize = 5, showPagination = TRUE,
  pageSizeOptions = c(5, 10, 50, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = TRUE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}  

################################################################################
norm_res_table <-  function(seq_table) {
reactable(seq_table,
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold"), minWidth = 100, headerVAlign = "center"
    ), 
  columns = list(
    metric = colDef(name = "Metric", filterable = TRUE,
                       sticky = "left", 
                       style = list(borderRight = "1px solid #eee"),
                       headerStyle = list(borderRight = "1px solid #eee"), 
                       align = "left",
                       minWidth = 100),
    `p-value (normality)` = colDef(name = "p-value (normality)", minWidth = 100, 
                                   resizable = FALSE, style = pval_style),
    `p-value (homogeneity)` = colDef(name = "p-value (homogeneity)", minWidth = 130, 
                                     resizable = FALSE, style = pval_style),
    `dataset` = colDef(name = "dataset", minWidth = 80, resizable = FALSE, filterable = TRUE),
    `method` = colDef(name = "method", minWidth = 120, resizable = FALSE, filterable = TRUE)
    ), 
  searchable = FALSE, defaultPageSize = 12, showPagination = FALSE,
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = TRUE, 
  wrap = TRUE, showSortable = FALSE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}  

################################################################################
sig_table <-  function(seq_table) {reactable(seq_table,
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold"), minWidth = 100
    ), 
  columns = list(
    dataset = colDef(name = "Dataset", 
                       sticky = "left", 
                       style = list(borderRight = "1px solid #eee"),
                       headerStyle = list(borderRight = "1px solid #eee"), 
                       align = "left",
                       minWidth = 80),
    year = colDef(name = "Year", minWidth = 80, align = "left"),
    `posthoc p-value` = colDef(name = "posthoc p-value", style = pval_style, cell = pval_cell),
    metric = colDef(name = "metric", minWidth = 140, align = "left"),
    `q-value` = colDef(name = "q-value", minWidth = 70, align = "center"),
    `normality p-value` = colDef(name = "p-value (normality)", minWidth = 100,),
    `homogeneity p-value` = colDef(name = "p-value (homogeneity)", minWidth = 130),
    `method` = colDef(name = "method", minWidth = 120)
    ), 
  searchable = FALSE, defaultPageSize = 12, showPagination = FALSE,
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = TRUE, 
  wrap = FALSE, showSortable = FALSE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.7em")))
}  
################################################################################
poshoc_table <-  function(seq_table) {reactable(seq_table,
    columns = list(
    Group_1 = colDef(name = "Group 1", minWidth = 100, align = "left", filterable = TRUE),
    Group_2 = colDef(name = "Group 2", 
                       sticky = "left", filterable = TRUE, 
                       style = list(borderRight = "5px solid #eee"),
                       headerStyle = list(borderRight = "5px solid #eee"), 
                       align = "left",
                       minWidth = 100),
    Observed_Y0 = colDef(name = "Year 0", style = pval_style, cell = pval_cell),
    Observed_Y1 = colDef(name = "Year 1", style = pval_style, cell = pval_cell),
    Observed_Y4 = colDef(name = "Year 4",
                       style = pval_style_border,
                       headerStyle = list(borderRight = "5px solid #eee"),
                       cell = pval_cell),

    Shannon_exp_Y0 = colDef(name = "Year 0",  style = pval_style, cell = pval_cell),
    Shannon_exp_Y1 = colDef(name = "Year 1", style = pval_style, cell = pval_cell),
    Shannon_exp_Y4 = colDef(name = "Year 4", 
                       style = pval_style_border,
                       headerStyle = list(borderRight = "5px solid #eee"),
                       cell = pval_cell),

    InvSimpson_Y0 = colDef(name = "Year 0", style = pval_style, cell = pval_cell),
    InvSimpson_Y1 = colDef(name = "Year 1", style = pval_style, cell = pval_cell),
    InvSimpson_Y4 = colDef(name = "Year 4",
                       style = pval_style_border,
                       headerStyle = list(borderRight = "5px solid #eee"),
                       cell = pval_cell)
    ),
  columnGroups = list(
    colGroup(name = "Observed richness", 
             columns = c("Observed_Y0", "Observed_Y1", "Observed_Y4"),
                       headerStyle = list(borderRight = "5px solid #eee", fontSize = "1.1em")),
    colGroup(name = "Shannon exponential", 
             columns = c("Shannon_exp_Y0", "Shannon_exp_Y1", "Shannon_exp_Y4"),
                       headerStyle = list(borderRight = "5px solid #eee", fontSize = "1.1em")),
    colGroup(name = "Simpson multiplicative inverse", 
             columns = c("InvSimpson_Y0", "InvSimpson_Y1", "InvSimpson_Y4"),
                       headerStyle = list(borderRight = "5px solid #eee", fontSize = "1.1em"))
  ),
  defaultColDef = colDef(
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    #cell = function(value) format(value, nsmall = 4),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold"), minWidth = 100
    ), 
  searchable = TRUE, defaultPageSize = 6, showPagination = FALSE,
  pageSizeOptions = c(5, 10, 50, nrow(seq_table)), 
  showPageSizeOptions = FALSE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = TRUE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.7em")))
}  
################################################################################

################################################################################

