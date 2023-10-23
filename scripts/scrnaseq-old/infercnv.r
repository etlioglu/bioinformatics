library(infercnv)
library(Seurat)
library(parallel)
library(ggplot2)
library(reshape2)

my_infercnv <- function(sample_name) {
  
  print("---###---")
  print(sample_name)
  print("---###---")
  
  # my_data is in the global env
  counts_matrix <- my_data@assays$RNA@counts[,colnames(my_data)]
  counts_matrix <- counts_matrix[,startsWith(colnames(counts_matrix), paste0(sample_name, "_"))]
  
  # Sample annotation file
  meta_data <- my_data@meta.data[my_data@meta.data$sample_name == sample_name,]
  sample_annot <- data.frame(rownames(meta_data),
                             meta_data$sl_cellassign_celltypes)
  names(sample_annot) <- c("cell_name", "cell_type")
  
  # remove cell types that are not represented by at least 20 cells
  # sample_annot <- data.table::data.table(sample_annot)[,
  #                                                      `:=`(num_cells = .N),
  #                                                           by = "cell_type"]
  # sample_annot <- sample_annot[sample_annot$num_cells >= 20,]
  
  # I don't remember any more why cell annotations should be read from a file
  write.table(sample_annot[,1:2],
              file = "cellAnnotations.txt",
              quote = FALSE,
              sep = "\t",
              row.names = FALSE,
              col.names = FALSE)
  cell_types <- as.vector(unique(sample_annot$cell_type))
  ref_group_names <- cell_types[cell_types != "Epithelial cells"]
  # create the infercnv object
  infercnv_obj = CreateInfercnvObject(raw_counts_matrix=counts_matrix,
                                      annotations_file="cellAnnotations.txt",
                                      delim="\t",
                                      gene_order_file="making-genome-postition-file/gene_name-GRCh38.93-gene_ordering_file.txt",
                                      ref_group_names=ref_group_names)
  # output_dir <- paste0("./output/",
  #                      sample_name,
  #                      "/")
  # output_dir <- paste0("./output/",
  #                      sample_name)
  # cutoff=1 works well for Smart-seq2, and cutoff=0.1 works well for 10x Genomics
  infercnv_obj = infercnv::run(infercnv_obj,
                               cutoff=0.1, 
                               out_dir="output",
                               cluster_by_groups=FALSE,
                               denoise=TRUE,
                               HMM=TRUE,
                               analysis_mode="subclusters",
                               num_threads = detectCores(),
                               resume_mode = FALSE)
  
  seurat_object <- subset(my_data,
                          cells = rownames(meta_data))
  
  seurat_obj = infercnv::add_to_seurat(infercnv_output_path="output",
                                       seurat_obj=seurat_object, # optional
                                       top_n=10
  )
  
  infercnv_metadata <- read.table(paste0("output",
                                         "/map_metadata_from_infercnv.txt"),
                                  header = TRUE,
                                  sep = "\t")
  
  prop_cols <- grep("^proportion_cnv_[[0-9]{1,2}|[X|Y|MT]]",
                    colnames(infercnv_metadata),
                    value = TRUE)
  
  # exclude X, Y and mito chromosomes
  prop_cols <- grep("^proportion_cnv_[0-9]{1,2}",
                    colnames(infercnv_metadata),
                    value = TRUE)
  
  infercnv_metadata_annots <- merge(sample_annot,
                                    infercnv_metadata,
                                    by.x = "cell_name",
                                    by.y = "row.names")
  
  prop_annot_cols <- c("cell_type", prop_cols)
  infercnv_metadata_long <- melt(infercnv_metadata_annots[,prop_annot_cols])
  infercnv_metadata_long$type <- ifelse(infercnv_metadata_long$cell_type == "Epithelial cells",
                                        "Epithelial cells",
                                        "Reference")
  
  hist_per_type <-
    ggplot(infercnv_metadata_long) +
    geom_histogram(aes(x = value, fill = cell_type)) +
    facet_wrap(~variable) +
    scale_fill_manual(values =   colors <- c("#DE6086",
                                             "#3F99C4",
                                             "#F2AF78",
                                             "#D77EBE",
                                             "#52BCCC",
                                             "#903FAE",
                                             "#5AA971",
                                             "#F3B958",
                                             "#BF4A43",
                                             "#3A6393")) +
    theme(axis.text.x = element_text(angle = 45, hjust = 1),
          legend.position="bottom")
  
  hist_epit_vs_rest <-
    ggplot(infercnv_metadata_long) +
    geom_histogram(aes(x = value, fill = type)) +
    facet_wrap(~variable) +
    scale_fill_manual(values = c("Epithelial cells"="#DE6086",
                                 "Reference"="#3A6393")) +
    theme(axis.text.x = element_text(angle = 45, hjust = 1),
          legend.position="bottom")
  
  ggsave(filename = paste0("output/",
                           sample_name,
                           "_hist_per_type",
                           ".png"),
         plot = hist_per_type)
  
  ggsave(filename = paste0("output/",
                           sample_name,
                           "_hist_epit_vs_rest",
                           ".png"),
         plot = hist_epit_vs_rest)
  
  seurat_obj@meta.data$has_cnv <- rowSums(infercnv_metadata[,prop_cols]) > 0.25
  
  table(seurat_obj@meta.data$sl_cellassign_celltypes,
        seurat_obj@meta.data$has_cnv)
  
  saveRDS(seurat_obj,
          file = paste0("output/",
                        sample_name,
                        ".rds")
  )
  
  file.rename("output",
              paste0("output_",
                     sample_name))
  
  file.rename("custom_infercnv.Rout",
              paste0("custom_infercnv.Rout_",
                     sample_name))
}

dir.create("output")

my_data <- readRDS("/scratch/leuven/319/vsc31908/infercnv/PAN_PENG_peng-annot_manual-annot_meta-data-sanitized_merged_cellassign_SingleR_SCTransformed_filtered_QCed_object_list.rds")

# counts_matrix = GetAssayData(my_data,
#                              slot="counts")


sample_names <- c("T1", "T10", "T11", "T12", "T13")

for (i in sample_names) {
  my_infercnv(i)
}