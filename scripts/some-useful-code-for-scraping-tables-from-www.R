webpage <- read_html("http://rafalab.dfci.harvard.edu/pages/harvardx.html")

tbls <- html_nodes(webpage, "table")

web_content_as_list <- webpage %>%
  html_nodes("table") %>%
  html_table(fill = TRUE)

write.csv(reduce(web_content_as_list[1:7], rbind), "test.csv", row.names=FALSE)
