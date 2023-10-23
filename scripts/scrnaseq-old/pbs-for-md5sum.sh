#!/bin/bash -l
#PBS -l walltime=06:00:00
#PBS -l nodes=1:ppn=36
#PBS -M emre.etlioglu@kuleuven.be
#PBS -m aeb
#PBS -N md5sum-DATA
#PBS -A lp_zic2

cd /staging/leuven/stg_00062
find DATA-2* -type f -exec md5sum {} \; | sort -k 2 -d | md5sum > DATA-md5sum-vsc-pbs.txt