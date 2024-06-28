#!/usr/bin/bash

# TODO Compare calcualated and downloaded hashes

VERSION="release-112"
SPECIES="mus_musculus"
GENOME_FILE="Mus_musculus.GRCm39.dna_sm.primary_assembly.fa.gz"
ANNOTATION_FILE="Mus_musculus.GRCm39.112.gtf.gz"

PATH_PREFIX="ftp://ftp.ensembl.org/pub/$VERSION"

# GENOME

wget $PATH_PREFIX/fasta/$SPECIES/dna/$GENOME_FILE
echo -e '\033[0;31m' Calculating checksum for the genome: "$(sum $GENOME_FILE)" '\033[0m'

wget $PATH_PREFIX/fasta/$SPECIES/dna/CHECKSUMS
echo -e '\033[0;31m' Checksum of the genome on the server: "$(grep $GENOME_FILE CHECKSUMS)" '\033[0m'

rm CHECKSUMS

# ANNOTATION FILE

wget $PATH_PREFIX/gtf/$SPECIES/$ANNOTATION_FILE
echo -e '\033[0;31m' Calculating checksum for the annotation: "$(sum $ANNOTATION_FILE)" '\033[0m'

wget $PATH_PREFIX/gtf/$SPECIES/CHECKSUMS
echo -e '\033[0;31m' Checksum of the annotation on the server: "$(grep $ANNOTATION_FILE CHECKSUMS)" '\033[0m'

rm CHECKSUMS
