#!/bin/bash -l
#PBS -l walltime=06:00:00
#PBS -l nodes=1:ppn=36
#PBS -M emre.etlioglu@kuleuven.be
#PBS -m aeb
#PBS -N md5sum-staging
#PBS -A lp_zic2

cd /staging/leuven/stg_00062
shopt -s extglob
rsync -ahr --progress --checksum /scratch/leuven/319/vsc31908/!(sra) .
shopt -u extglob