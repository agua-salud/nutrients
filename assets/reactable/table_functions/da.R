indval_summ_table <- function(seq_table) {
reactable(seq_table,
  defaultColDef = colDef(headerStyle = list(fontSize = "0.9em"),
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE    
    ), 
  columns = list(
    dataset = colDef(name = "Data set", sticky = "left", style = border_style,
                       headerStyle = header_style, align = "left",
                       minWidth = 150, filterable = TRUE), 
    
    year = colDef(name = "Year", filterable = TRUE),
    total_reads = colDef(name = "Total reads"),
    indval_reads = colDef(name = "IndVal reads"),
    per_reads = colDef(name = "Percent reads", cell = per_cell),
    total_asvs = colDef(name = "Total ASVs"),
    indval_asvs = colDef(name = "IndVal ASVs"),
    per_asvs = colDef(name = "Percent ASVs", cell = per_cell)
    ),
  searchable = FALSE, defaultPageSize = 12, 
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = FALSE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = FALSE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}
################################################################################
indval_table <-  function(seq_table) {
  reactable(seq_table,
  defaultColDef = colDef(headerStyle = list(fontSize = "0.9em"),
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE
    ), 
  columns = list(
    ASV_ID = colDef(name = "ASV_ID", sticky = "left", style = border_style,
                       headerStyle = header_style, align = "left",
                       minWidth = 100, filterable = TRUE), 
    
    group = colDef(name = "enriched", filterable = TRUE),
    indval = colDef(name = "indval score", minWidth = 130),
    pval = colDef(name = "p-value", style = border_style, headerStyle = header_style),
    
    freq = colDef(name = "all samples"),
    freq_CTL = colDef(name = "CTL"),
    freq_N = colDef(name = "N"),
    freq_P = colDef(name = "P"),
    freq_NP = colDef(name = "NP", style = border_style, headerStyle = header_style),
    
    reads_total = colDef(name = "all"),
    reads_CTL = colDef(name = "CTL"),
    reads_N = colDef(name = "N"),
    reads_P = colDef(name = "P"),
    reads_NP = colDef(name = "NP", style = border_style, headerStyle = header_style),
    
    Kingdom = colDef(filterable = TRUE),
    Phylum = colDef(filterable = TRUE),
    Class = colDef(filterable = TRUE),
    Order = colDef(filterable = TRUE),
    Family = colDef(filterable = TRUE),
    Genus = colDef(filterable = TRUE),
    
    ASV_SEQ = colDef(name = "ASV sequence")
    ),
  columnGroups = list(
      colGroup(name = "Indicator analysis results", sticky = "left",
             columns = c("group", "indval", "pval"), 
             headerStyle = header_style_grp),
      colGroup(name = "Frequency", 
             columns = c("freq", 
                         "freq_CTL", "freq_N", "freq_P", "freq_NP"), 
             headerStyle = header_style_grp),
      colGroup(name = "Read totals", 
             columns = c("reads_total", 
                         "reads_CTL", "reads_N", "reads_P", "reads_NP"), 
             headerStyle = header_style_grp),
      colGroup(name = "Lineage", align = "left",
             columns = c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus"))
      ),
  searchable = TRUE, defaultPageSize = 5, 
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = FALSE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}  
################################################################################
combo_table <-  function(seq_table) {
  reactable(seq_table,
  defaultColDef = colDef(headerStyle = list(fontSize = "0.8em"),
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE
    ), 
  columns = list(
    ASV_ID = colDef(name = "ASV ID", sticky = "left", style = border_style,
                       headerStyle = header_style, align = "left",
                       minWidth = 100, filterable = TRUE), 
    
    group_Y0 = colDef(name = "Year 0", filterable = TRUE, style = na_style),
    group_Y1 = colDef(name = "Year 1", filterable = TRUE, style = na_style),
    group_Y4 = colDef(name = "Year 4", filterable = TRUE, 
                      style = na_border_style, 
                      headerStyle = header_style),
    reads_Y0 = colDef(name = "Year 0", style = na_style),
    reads_Y1 = colDef(name = "Year 1", style = na_style),
    reads_Y4 = colDef(name = "Year 4", 
                      style = na_border_style, 
                      headerStyle = header_style),
    freq_Y0 = colDef(name = "Year 0", style = na_style),
    freq_Y1 = colDef(name = "Year 1", style = na_style),
    freq_Y4 = colDef(name = "Year 4", 
                      style = na_border_style, 
                      headerStyle = header_style),
    indval_Y0 = colDef(name = "Year 0", style = na_style),
    indval_Y1 = colDef(name = "Year 1", style = na_style),
    indval_Y4 = colDef(name = "Year 4", 
                      style = na_border_style, 
                      headerStyle = header_style),
    pval_Y0 = colDef(name = "Year 0", style = na_style),
    pval_Y1 = colDef(name = "Year 1", style = na_style),
    pval_Y4 = colDef(name = "Year 4", 
                      style = na_border_style, 
                      headerStyle = header_style),
    

    Kingdom = colDef(filterable = TRUE),
    Phylum = colDef(filterable = TRUE),
    Class = colDef(filterable = TRUE),
    Order = colDef(filterable = TRUE),
    Family = colDef(filterable = TRUE),
    Genus = colDef(filterable = TRUE),
    
    ASV_SEQ = colDef(name = "ASV sequence")
    ),
  columnGroups = list(
      colGroup(name = "Enriched group", sticky = "left",
             columns = c("group_Y0", "group_Y1", "group_Y4"), 
             headerStyle = header_style_grp),
      colGroup(name = "Total reads", 
               columns = c("reads_Y0", "reads_Y1", "reads_Y4"), 
               headerStyle = header_style_grp),
      colGroup(name = "Frequency", 
               columns = c("freq_Y0", "freq_Y1", "freq_Y4"), 
               headerStyle = header_style_grp),
      colGroup(name = "IndVal score", 
               columns = c("indval_Y0", "indval_Y1", "indval_Y4"), 
               headerStyle = header_style_grp),
      colGroup(name = "p-value", 
               columns = c("pval_Y0", "pval_Y1", "pval_Y4"), 
               headerStyle = header_style_grp),
      colGroup(name = "Lineage", align = "left",
             columns = c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus"),
             headerStyle = list(fontSize = "1em"))
      ),
  searchable = TRUE, defaultPageSize = 5, 
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = FALSE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}  
################################################################################
lefse_summ_table <- function(seq_table) {
  reactable(seq_table,
  defaultColDef = colDef(headerStyle = list(fontSize = "0.9em"),
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE    
    ), 
  columns = list(
    dataset = colDef(name = "Data set", sticky = "left", style = border_style,
                       headerStyle = header_style, align = "left",
                       minWidth = 150, filterable = TRUE), 
    
    year = colDef(name = "Year", filterable = TRUE),
    total_reads = colDef(name = "Total reads"),
    lefse_reads = colDef(name = "LEfSe reads"),
    per_reads = colDef(name = "Percent reads", cell = per_cell),
    total_asvs = colDef(name = "Total ASVs"),
    lefse_asvs = colDef(name = "LEfSe ASVs"),
    per_asvs = colDef(name = "Percent ASVs", cell = per_cell)
    ),
  searchable = FALSE, defaultPageSize = 12, 
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = FALSE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = FALSE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}
################################################################################
lefse_asv_table <-  function(seq_table) {
  reactable(seq_table,
  defaultColDef = colDef(headerStyle = list(fontSize = "0.9em"),
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE
    ), 
  columns = list(
    ASV_ID = colDef(name = "ASV_ID", sticky = "left", style = border_style,
                       headerStyle = header_style, align = "left",
                       minWidth = 100, filterable = TRUE), 
    
    group = colDef(name = "enriched", filterable = TRUE),
    ef_lda = colDef(name = "LDA score", minWidth = 130),
    pval = colDef(name = "p-value", style = border_style, headerStyle = header_style),
    
    freq = colDef(name = "all samples"),
    freq_CTL = colDef(name = "CTL"),
    freq_N = colDef(name = "N"),
    freq_P = colDef(name = "P"),
    freq_NP = colDef(name = "NP", style = border_style, headerStyle = header_style),
    
    reads_total = colDef(name = "all"),
    reads_CTL = colDef(name = "CTL"),
    reads_N = colDef(name = "N"),
    reads_P = colDef(name = "P"),
    reads_NP = colDef(name = "NP", style = border_style, headerStyle = header_style),
    
    Kingdom = colDef(filterable = TRUE),
    Phylum = colDef(filterable = TRUE),
    Class = colDef(filterable = TRUE),
    Order = colDef(filterable = TRUE),
    Family = colDef(filterable = TRUE),
    Genus = colDef(filterable = TRUE),
    
    ASV_SEQ = colDef(name = "ASV sequence")
    ),
  columnGroups = list(
      colGroup(name = "LEfSe results", sticky = "left",
             columns = c("group", "ef_lda", "pval"), 
             headerStyle = header_style_grp),
      colGroup(name = "Frequency", 
             columns = c("freq", 
                         "freq_CTL", "freq_N", "freq_P", "freq_NP"), 
             headerStyle = header_style_grp),
      colGroup(name = "Read totals", 
             columns = c("reads_total", 
                         "reads_CTL", "reads_N", "reads_P", "reads_NP"), 
             headerStyle = header_style_grp),
      colGroup(name = "Lineage", align = "left",
             columns = c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus"),
             headerStyle = list(fontSize = "1em"))
      ),
  searchable = TRUE, defaultPageSize = 5, 
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = FALSE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}  
################################################################################
lefse_combo_table <-  function(seq_table) {
  reactable(seq_table,
  defaultColDef = colDef(headerStyle = list(fontSize = "0.8em"), style = na_style, 
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "center", filterable = FALSE, sortable = TRUE, resizable = TRUE
    ), 
  columns = list(
    ASV_ID = colDef(name = "ASV ID", sticky = "left", style = border_style,
                       headerStyle = header_style, align = "left",
                       minWidth = 100, filterable = TRUE), 
    
    group_Y0 = colDef(name = "Year 0", filterable = TRUE),
    group_Y1 = colDef(name = "Year 1", filterable = TRUE),
    group_Y4 = colDef(name = "Year 4", filterable = TRUE, 
                      style = na_border_style, 
                      headerStyle = header_style),
    reads_Y0 = colDef(name = "Year 0"),
    reads_Y1 = colDef(name = "Year 1"),
    reads_Y4 = colDef(name = "Year 4", 
                      style = na_border_style, 
                      headerStyle = header_style),
    freq_Y0 = colDef(name = "Year 0"),
    freq_Y1 = colDef(name = "Year 1"),
    freq_Y4 = colDef(name = "Year 4", 
                      style = na_border_style, 
                      headerStyle = header_style),
    lda_Y0 = colDef(name = "Year 0"),
    lda_Y1 = colDef(name = "Year 1"),
    lda_Y4 = colDef(name = "Year 4", 
                      style = na_border_style, 
                      headerStyle = header_style),
    pval_Y0 = colDef(name = "Year 0"),
    pval_Y1 = colDef(name = "Year 1"),
    pval_Y4 = colDef(name = "Year 4", 
                      style = na_border_style, 
                      headerStyle = header_style),
    

    Kingdom = colDef(filterable = TRUE),
    Phylum = colDef(filterable = TRUE),
    Class = colDef(filterable = TRUE),
    Order = colDef(filterable = TRUE),
    Family = colDef(filterable = TRUE),
    Genus = colDef(filterable = TRUE),
    
    ASV_SEQ = colDef(name = "ASV sequence")
    ),
  columnGroups = list(
      colGroup(name = "Enriched group", sticky = "left",
             columns = c("group_Y0", "group_Y1", "group_Y4"), 
             headerStyle = header_style_grp),
      colGroup(name = "Total reads", 
               columns = c("reads_Y0", "reads_Y1", "reads_Y4"), 
               headerStyle = header_style_grp),
      colGroup(name = "Frequency", 
               columns = c("freq_Y0", "freq_Y1", "freq_Y4"), 
               headerStyle = header_style_grp),
      colGroup(name = "LDA score", 
               columns = c("lda_Y0", "lda_Y1", "lda_Y4"), 
               headerStyle = header_style_grp),
      colGroup(name = "p-value", 
               columns = c("pval_Y0", "pval_Y1", "pval_Y4"), 
               headerStyle = header_style_grp),
      colGroup(name = "Lineage", align = "left",
             columns = c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus"),
             headerStyle = list(fontSize = "1em"))
      ),
  searchable = TRUE, defaultPageSize = 5, 
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = FALSE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}  
################################################################################
lefse_marker_table <-  function(seq_table) {
reactable(seq_table,
  defaultColDef = colDef(headerStyle = list(fontSize = "0.8em"), style = na_style,
    header = function(value) gsub("_", " ", value, fixed = TRUE),
    cell = function(value) format(value, nsmall = 0),
    align = "left", filterable = TRUE, sortable = TRUE, resizable = TRUE,
    footerStyle = list(fontWeight = "bold")
    ), 
  columns = list(
    taxa = colDef(name = "taxa", minWidth = 100),
    rank = colDef(name = "rank  ", 
                       sticky = "left", 
                       style = list(borderRight = "5px solid #eee"),
                       headerStyle = list(borderRight = "5px solid #eee", fontSize = "0.8em"), 
                       align = "left"), 
    marker = colDef(name = "Marker", 
                       sticky = "left", 
                       style = list(borderRight = "5px solid #eee"),
                       headerStyle = list(borderRight = "5px solid #eee", fontSize = "0.8em"), 
                       align = "left",
                       minWidth = 100), 
    group = colDef(name = "enriched", align = "center"),
    ef_lda = colDef(name = "LDA score", align = "center", filterable = FALSE,
                       minWidth = 100),
    pval = colDef(name = "p-value", align = "center", filterable = FALSE,
                  style = list(borderRight = "5px solid #eee"),
                  headerStyle = list(borderRight = "5px solid #eee", fontSize = "0.8em")),
    ASV_ID = colDef(name = "ASV ID", filterable = TRUE)
    ),
  columnGroups = list(
      colGroup(name = "Marker ID", sticky = "left",
             columns = c("taxa", "rank"), 
             headerStyle = list(fontSize = "1em", borderRight = "5px solid #eee")),
      colGroup(name = "LEfSe results", sticky = "left",
             columns = c("group", "ef_lda", "pval"), 
             headerStyle = list(fontSize = "1em", borderRight = "5px solid #eee")),
      colGroup(name = "Lineage", align = "left",
             columns = c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus"), 
             headerStyle = list(fontSize = "1em"))
      ),
  searchable = TRUE, defaultPageSize = 5, 
  pageSizeOptions = c(5, 10, nrow(seq_table)), 
  showPageSizeOptions = TRUE, highlight = TRUE, 
  bordered = TRUE, striped = TRUE, compact = FALSE, 
  wrap = FALSE, showSortable = TRUE, fullWidth = TRUE,
  theme = reactableTheme(style = list(fontSize = "0.8em")))
}  
################################################################################

################################################################################
