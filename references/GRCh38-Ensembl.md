From `nf-core` (<https://nf-co.re/usage/reference_genomes>):

> The transcriptome and GTF files in iGenomes are vastly out of date with respect to current annotations from Ensembl e.g. human iGenomes annotations are from Ensembl release 75, while the current Ensembl release is 108. Please consider downloading and using a more updated version of your reference genome as outlined in the next section.

Moreover:

> The GRCh38 iGenomes assembly is from the NCBI and not Ensembl and as such there are some discrepancies in the way that the annotation is defined that may cause problems when running certain pipelines e.g. nf-core/rnaseq#460. If you would like to use the latest soft-masked Ensembl assembly for GRCh38 instead please see the next section.

The same page contains a bash script for downlaoding a genome and its corresponding annotation file:

```         
#!/bin/bash

VERSION=...
wget -L ftp://ftp.ensembl.org/pub/release-$VERSION/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa.gz
wget -L ftp://ftp.ensembl.org/pub/release-$VERSION/gtf/homo_sapiens/Homo_sapiens.GRCh38.$VERSION.gtf.gz
```

If the `wget` commands above do not work because of security reasons (<https://www.biostars.org/p/9538957/>), one can use the `http` protcol instead.

Genome (README.txt for the genome: <http://ftp.ensembl.org/pub/release-109/fasta/homo_sapiens/dna/README>):

```         
wget http://ftp.ensembl.org/pub/release-109/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa.gz

# checksum: 56549 919614
sum Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa.gz
```

Annotation (README.txt for the annotation: <http://ftp.ensembl.org/pub/release-109/gtf/homo_sapiens/README>):

```         
wget http://ftp.ensembl.org/pub/release-109/gtf/homo_sapiens/Homo_sapiens.GRCh38.109.gtf.gz

# checksum: 26235 52988
sum Homo_sapiens.GRCh38.109.gtf.gz
```

nf-core rnaseq can make use of a pre-indexed genome and to that end after a `nf-core rnaseq` run with the option `save-reference` using the aforementioned genome and annotation, the "star index" folder as well as the resulting `bed` file (Homo_sapiens.GRCh38.109.bed) were copied to the directory with the abovementioned files.
