# Introduction to NGS Bioinformatics Workshop, 31.03.2017

JEROEN

- MiSeq, NextSeq, HiSeq 2000, Hiseq 4000, NovaSeq
- clonal amplification
	- Heliscope and PacBio do not need this step
- P5 - index 2 - Rd1 SP (sequencing primer 1) - insert - Rd2 SP (sequencing primer 2) - index 1 - P7
	- P5 and P7 are used for binding to the flow-cell
- …
	1. fragmentation
	2. end-repair
	3. A-overhang
	4. Addition of adapters
	5. Adaptor ligation
		- addition of P5 and P7
	6. the product is ready for cluster generation
- Nextra library preparation uses tagmentation
- The flow-cell has P5 & P7
	- required for clonal amplification
	- clonal amplification is performed by bridge PCR
- clustering density is proportional to the loaded material
- patterned vs non-patterned flow-cells
	- organized vs non-organized
- total cluster count vs post filter
	- as overlapping clusters are removed
- Phasing / Pre-phasing: More bases are added in a step instead of just one base. A cluster which was prone to phasing is not in sync any more
- demultiplexing

ALVARO

- On disk:
	- Human genome: 300 GB
	- Human exome: 6 GB
	- RNA-Seq: 1 GB
- Google Genomics
- bioinformatics costs:
	- storage
	- CPU
	- data analysis
- counting reads in fastq files:
	- zcat my_fastq.gz | echo $((“wc -l"/4))
	- wc -> word count
- FASTQ file header information
	- instrument
	- run control
	- flowcell ID
	- lane
	- tile
	- position
	- read
	- filter
	- index
- Q-score: prediction of probability of an error in base calling
- alignment vs mapping
	- alignment: read seq vs genome seq, including gaps, …
	- mapping: pos of the read WRT the genome
ERICA

- fastq_screen: for contamination check
- over represented sequences: short inserts cause sequencing of adaptors, primers; in the end causing accumulation of reads with these sequences
- fastq_mcf

LUC

- Increasing mapping quality:
	- read on: using longer reads
	- use paired-end sequencing
- soft-clipping
- BAM files contain the sequence quality values too
- alignment matrix: obtain by using one of the picard tools
- VCF-like format:
	- GT:AD:DP:GQ:PL
	- genotype:allelic depth:depth:genotype quality:?
ALEX

ALVARO

- number of replicates:
	- cell lines -> 4
	- inbred mice -> 5 replicates
	- human -> 7 or 8 replicates
- Tophat aligns reads first to the “virtual transcriptome"
	- hence is fast
- HTSeq: counts the reads after alignment
	- count each read only once
	- multi-mapping reads and reads overlapping multiple features are discarded
	- reports absolute counts for each sample and feature (genes, transcripts, …)
- adjusting for library size: by size factors
	- once adjusted, counts are not integers any more -> relative count
- models:
	- EdgeR : negative binomial distribution
	- DESeq: negative binomial distribution
	- cuffdiff2: beta negative binomial distribution
- q value = Bonforroni correction = adjusted p value
	- the more trials (for example checking for DE of 20,000 genes) the more chance to get false positives. This has to be corrected!
- HISTAT will replace Tophat