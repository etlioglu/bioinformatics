# Project Management

Rename sample names: 1.txt should be 01.txt if there are more than 9 samples and should be 001 if there are more than 99 samples! This will help keeping track of data, for example one can sort received data by their name in a sensible way.

- `project-setup` folder
  - within the `Teams`/`Slack` channel and also in the `git` repo, the one within the git repo would have precedence
  - analysis request form with for relevant info
  - sample sheet
  - contrast sheet (in the case of a differential abundance analysis)
- `git` repo
  - dedicated folder per task (RNA-seq, proteomics, etc...)
- `Teams`/`Slack` channel
  - link to the git repo
- Secure raw data

  - in case of multiple runs (technical replicates) of a RNA-seq sample:

    cat fastq_rep1.gz fastq_rep2.gz > combined_fastq.gz

This will make things easier when submitting raw data to a repository such as `GEO` or `ArrayExpress`

- Update the `data-catalog.xlsx` with the coordinates of the raw data associated with the project
