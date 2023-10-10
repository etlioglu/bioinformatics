# bioMart seems to still have not-at-all-informative attribute names for the cellular localization GO terms
# https://support.bioconductor.org/p/39425/#39426

# Integrated subcellular localization dataset from http://comppi.linkgroup.hu/downloads
library(tidyverse)

int_sub_cell_loc <- read.delim("comppi--proteins_locs--tax_hsapiens_loc_all.txt") |>
  mutate(ensembl_id = str_extract(Synonyms, "ENSG\\d*")) |>
  dplyr::select(c("ensembl_id", "Major.Loc.With.Loc.Score", "Minor.Loc")) |>
  distinct()

write.csv(
  int_sub_cell_loc,
  "int_sub_cell_loc.csv",
  quote = FALSE,
  row.names = FALSE
)
