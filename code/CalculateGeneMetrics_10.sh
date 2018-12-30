#!/bin/bash

output=$1

bam_inputs=`ls ${output}/subfile_*`
for bam_input in ${bam_inputs[@]}; do 
bam_folder=`echo  ${bam_input} | sed -e 's/subfile_/subfolder_/' -e s/\.bam$//g`
bam_input=${bam_folder}/gene-sorted.bam

/usr/bin/time -v CalculateGeneMetrics -i ${bam_input} -o ${bam_folder}/gene-metrics.csv.gz

done;
