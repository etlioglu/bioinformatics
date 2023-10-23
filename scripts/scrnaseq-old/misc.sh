library(Seurat)
 library(ggplot2)
 library(viridis) # for the viridis color palatte for the violin plots
 my_data <- readRDS("/DATA/project-pancreas-peng/PAN_PENG_peng-annot_manual-annot_meta-data-sanitized_merged_cellassign_SingleR_SCTransformed_filtered_QCed_object_list.rds")
 # change the tentative "Epithelial-Fibroblast" (manual annotation) to "Epithelial"
my_data@meta.data$manual_annot[my_data@meta.data$manual_annot == "Epithelial-Fibroblast"] <- "Epithelial"
 my_data <- SetIdent(my_data,
                    value = my_data@meta.data$manual_annot)
 my_data <- SetIdent(my_data,
                    value = my_data@meta.data$sl_singler_pruned.labels)
 # add a "sample origin" column
my_data@meta.data$origin <- ifelse(startsWith(my_data@meta.data$sample_name, "N"),
                                   "Normal",
                                   "Tumor")
my_data@meta.data$origin <- factor(my_data@meta.data$origin,
                                   levels = c("Tumor", "Normal"))
 VlnPlot(my_data,
        features = "CDA",
        assay = "SCT",
        slot = "counts",
        pt.size = 0) +
  # facet_wrap(~my_data@meta.data$origin,
  #            ncol = 1) +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_viridis_d() +
  ggtitle("Peng et al., 2019")
 my_data <- readRDS("")