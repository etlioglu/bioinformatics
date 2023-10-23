#!/bin/bash -l
#PBS -l walltime=12:00:00
#PBS -l nodes=1:ppn=36
#PBS -M emre.etlioglu@kuleuven.be
#PBS -m aeb
#PBS -N fastq-dump
#PBS -A lp_zic2

for SRR in SRR8872326 SRR8872327 SRR8872328 SRR8872329 SRR8872330 SRR8872331 SRR8872332 SRR8872333
do
        cd /scratch/leuven/319/vsc31908/sra
        /staging/leuven/stg_00062/sratoolkit.2.10.3-centos_linux64/bin/fastq-dump \
        --split-files \
        "${SRR}.sra"
done