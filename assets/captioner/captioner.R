#### captioner setup

caption_tab_ssu <- captioner(prefix = "(16S rRNA) Table", suffix = " |", style = "b")
caption_fig_ssu <- captioner(prefix = "(16S rRNA) Figure", suffix = " |", style = "b")

caption_tab_its <- captioner(prefix = "(ITS) Table", suffix = " |", style = "b")
caption_fig_its <- captioner(prefix = "(ITS) Figure", suffix = " |", style = "b")
# Create a function for referring to the tables in text
ref <- function(x) str_extract(x, "[^|]*") %>% 
  trimws(which = "right", whitespace = "[ ]")
