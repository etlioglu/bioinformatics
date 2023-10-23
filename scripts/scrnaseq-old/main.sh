#!/usr/bin/bash


# data set Peng et al., 2019


DATASET_PATH="/DATA/raw-matrices/raw-matrices_PAN_PENG-cellranger310-GRCh38_93/"
DATASET_ABBR="PAN-PENG"
SAMPLE_NAME_PREFIX="NULL"
PROJECT_DIR="/DATA/project-pancreas/"
CODE_DIR="/DATA/single-cell-pipeline/code/"


READ_DATA_QC_SCRIPT="00_read_data_QC_v3.R"
FILTER_SCRIPT="01_filter_v3.R"
SCTRANSFORM_SCRIPT="02_SCTransform_v3.R"
SINGLER_SCRIPT="03_singler_automated_annotation_v3.R"
NORMALIZATION_SCRIPT="04_dataset_level_normalization_PCA_v3.R"
CLUSTERING_SCRIPT="05_clustering_v3.R"


BAD_SAMPLES=("T02" "T07")
DIMS="1:30"


<< --MULTILINE-COMMENT--


# 0
# Read data and perform QC


nohup Rscript --vanilla \
  $CODE_DIR$READ_DATA_QC_SCRIPT \
    $DATASET_PATH \
    $DATASET_ABBR \
    $SAMPLE_NAME_PREFIX \
    $PROJECT_DIR \
    &> "${PROJECT_DIR}log-${READ_DATA_QC_SCRIPT}out"


# 1
# Filter low quality samples


nohup Rscript --vanilla \
    $CODE_DIR$FILTER_SCRIPT \
    $DATASET_ABBR \
    $PROJECT_DIR \
    ${BAD_SAMPLES[@]} \
    &> "${PROJECT_DIR}log-${FILTER_SCRIPT}out"


# 2 
# Normalization at the sample level


nohup Rscript --vanilla \
  $CODE_DIR$SCTRANSFORM_SCRIPT \
  $DATASET_ABBR \
  $PROJECT_DIR \
  &> "${PROJECT_DIR}log-${SCTRANSFORM_SCRIPT}out"


# 3  
# SingleR at the sample level


nohup Rscript --vanilla \
  $CODE_DIR$SINGLER_SCRIPT \
  $DATASET_ABBR \
  $PROJECT_DIR \
  &> "${PROJECT_DIR}log-${SINGLER_SCRIPT}out"
  
# 4
# Normalization at the data set level


nohup Rscript --vanilla \
  $CODE_DIR$NORMALIZATION_SCRIPT \
  $DATASET_ABBR \
  $PROJECT_DIR \
  &> "${PROJECT_DIR}log-${NORMALIZATION_SCRIPT}out"


--MULTILINE-COMMENT--


# 5  
# Clustering
nohup Rscript --vanilla \
  $CODE_DIR$CLUSTERING_SCRIPT \
  $DATASET_ABBR \
  $PROJECT_DIR \
  $DIMS
  &> "${PROJECT_DIR}log-${CLUSTERING_SCRIPT}out"