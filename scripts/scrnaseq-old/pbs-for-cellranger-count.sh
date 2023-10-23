#!/bin/bash -l
#PBS -l walltime=12:00:00
#PBS -l nodes=1:ppn=36
#PBS -M emre.etlioglu@kuleuven.be
#PBS -m aeb
#PBS -N cellranger-PAN-018
#PBS -A lp_zic2

CELLRANGER_COUNT="/staging/leuven/stg_00062/software/cellranger-310/cellranger-3.1.0/cellranger count"

REF="/staging/leuven/stg_00062/software/cellranger-310/refdata-cellranger-GRCh38-3.0.0"

SAMPLE_LIST=("PAN018_LM" "PAN018_PAN" "PAN018_PT")

CHEMISTRY="auto"

OUTPUT_DIR="/staging/leuven/stg_00062/2020-04-17/cellranger-output"

cd $OUTPUT_DIR

for SAMPLE in ${SAMPLE_LIST[@]}
do

    SAMPLE_FASTQ_NAME="sc5r${SAMPLE}_hg19"
    FASTQ_PATH_1="/staging/leuven/stg_00062/fastq_300320/Next/$SAMPLE_FASTQ_NAME"
    FASTQ_PATH_2="/staging/leuven/stg_00062/fastq_300320/Nova/$SAMPLE_FASTQ_NAME"

    echo $SAMPLE_FASTQ_NAME
    echo $FASTQ_PATH_1
    echo $FASTQ_PATH_2

    # DOUBLE CHECK THE --fastqs ARGUMENT, USE "," TO SEPARATE PATHS
    $CELLRANGER_COUNT \
        --id=$SAMPLE \
        --sample=$SAMPLE_FASTQ_NAME \
        --transcriptome=$REF \
        --fastqs=$FASTQ_PATH_1,$FASTQ_PATH_2 \
    --chemistry=$CHEMISTRY \

    # remove the resulting BAM file as well as its index
    rm $SAMPLE/outs/possorted_genome_bam.bam*

done

# delete everything but the "outs" folder
# extglob shell option has to be enabled but this should be done outside of the for statement, see:
# https://unix.stackexchange.com/questions/45957/what-are-the-scope-restrictions-for-setting-shopt-extglob-and-other-options
# running a second for loop just for this in order not to intervene with the cellranger workflow
shopt -s extglob
for SAMPLE in ${SAMPLE_LIST[@]}
    do
    rm -r $SAMPLE/!(outs)
done
shopt -u extglob