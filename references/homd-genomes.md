# HOMD Genomes and corresponding annotations

This is performed for the `BEPSAR` project to distinguish reads, either from oral microbial transcriptomes or human transcriptome.

    lftp https://www.homd.org/ftp/genomes/PROKKA/V10.1/
    
    mirror fna --exclude ALL_genomes.fna

    # lftp www.homd.org:/ftp/genomes/PROKKA/V10.1> mirror fna --exclude ALL_genomes.fna
    # Total: 1 directory, 8622 files, 0 symlinks                           
    # New: 8622 files, 0 symlinks
    # 25133230689 bytes transferred in 7634 seconds (3.14M/s)

    mirror gff --exclude ALL_genomes.gff

    # lftp www.homd.org:/ftp/genomes/PROKKA/V10.1> mirror gff --exclude ALL_genomes.gff
    # Total: 1 directory, 8622 files, 0 symlinks                           
    # New: 8622 files, 0 symlinks
    # 31007349495 bytes transferred in 8885 seconds (3.33M/s)