# RNA-Seq Notes

- Prefiltering is not needed when using `DESeq2` as `results()` is performing `independent filtering` to remove genes with low power ([ref](https://support.bioconductor.org/p/65256/#65260)).

    > However, you typically don't need to pre-filter because independent filtering occurs within results() to save you from multiple test correction on genes with no power (see ?results and the vignette section about independent filtering, or the paper). The main reason to pre-filter would be to increase speed. Designs with many samples and many interaction terms can slow down on genes which have very few reads.