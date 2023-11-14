#!/bin/bash -ue
printf 'ref1_1.fq.gz '
gunzip -c ref1_1.fq.gz | wc -l
