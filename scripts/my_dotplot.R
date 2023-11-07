my_dotplot <- function(seurat_object, list_of_markers, text_size = 10) {
  xstart <- c()
  for (i in 1:(length(list_of_markers)-1)){
    print(i)
    xstart <- c(xstart, 0.5 + reduce(map(list_of_markers[1:i], length), sum))
    print(xstart)
  }
  xstart <- c(0.5, xstart)
  
  xend <- c()
  for (i in 1:length(list_of_markers)) {
    print(i)
    xend <- c(xend, 0.5 + reduce(map(list_of_markers[1:i], length), sum))
    print(xend)
  }
  
  cols <- names(list_of_markers)
  
  rects <- data.frame(xstart = xstart,
                      xend = xend,
                      col = cols)
  rects$col <- factor(rects$col, levels = rects$col)
  
  my_dotplot <- DotPlot(object = seurat_object,
                        genes.plot = unlist(rev(map(list_of_markers, rev))),
                        plot.legend = TRUE,
                        do.return = TRUE)
  my_dotplot +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1, size = text_size)) +
    geom_rect(data = rects,
              inherit.aes = FALSE,
              aes(xmin = xstart,
                  xmax = xend,
                  ymin = -Inf,
                  ymax = Inf,
                  fill = col),
              alpha = 0.5)
}

my_dotplot_rot <- function(seurat_object, list_of_markers) {
  my_dotplot <- DotPlot(object = seurat_object,
                        genes.plot = list_of_markers,
                        plot.legend = TRUE,
                        do.return = TRUE)
  my_dotplot +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 10)) +
    coord_flip()
}

check_genes <- function(data_combined, list_of_markers) {
  for (i in list_of_markers) {
    print(paste0("These genes could not be found in the dataset, try aliases: ",
                 i[!(i %in% rownames(data_combined@data))]))
  }
}

check_metadata <- function(Seurat_object) {
  head(Seurat_object@meta.data)
}

