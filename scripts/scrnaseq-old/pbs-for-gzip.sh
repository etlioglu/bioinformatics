#!/bin/bash -l
#PBS -l walltime=64:00:00
#PBS -l nodes=1:ppn=36
#PBS -M emre.etlioglu@kuleuven.be
#PBS -m aeb
#PBS -N gzip-moncada
#PBS -A lp_zic2

module load parallel

cd /scratch/leuven/319/vsc31908/sra-moncada

# use of here document from: https://docs.hpc.qmul.ac.uk/apps/general/gnuparallel/
parallel ::: <<ENDOFLIST
gzip *.fastq
ENDOFLIST