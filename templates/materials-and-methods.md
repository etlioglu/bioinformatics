# Materials and Methods

## nfcore reference

https://www.nature.com/articles/s41587-020-0439-x 

## nfcore/rnaseq

RNA-seq analysis was performed with nf-core/rnaseq version 3.12.0 (nf-core ref) using the default values except for: i) Ensembl GRCh38 release 109 was used as the reference genome, ii) salmon quant was run with the “--gcBias” parameter.

## nfcore/differentialabundance

Differential expression analysis was performed with nf-core/differentialabundance version 1.4.0 (nf-core ref) with the default values.

## RRHO with RedRibbon

Rank–rank hypergeometric overlap (RRHO) analysis was performed with the R package RedRibbon version 1.1.1 (ref DOI:10.26508/lsa.202302203).

