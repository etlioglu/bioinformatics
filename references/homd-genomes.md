# HOMD Genomes and corresponding annotations

This is performed for the `BEPSAR` project to distinguish reads, either from oral microbial transcriptomes or human transcriptome.

    lftp https://www.homd.org/ftp/genomes/PROKKA/V10.1/
    mirror fna --exclude ALL_genomes.fna
    mirror gff --exclude ALL_genomes.gff