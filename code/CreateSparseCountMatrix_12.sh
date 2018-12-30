#!/bin/bash

output=$1
gtf_file=/mnt/data2/reference/2.2.0/GRCh38/genes/genes.gtf

bam_inputs=`ls ${output}/subfile_*`
for bam_input in ${bam_inputs[@]}; do 
bam_folder=`echo  ${bam_input} | sed -e 's/subfile_/subfolder_/' -e s/\.bam$//g`
bam_input=${bam_folder}/cell-sorted.bam

/usr/bin/time -v CreateCountMatrix \
      --bam-file ${bam_input} \
      --output-prefix ${bam_folder}/sparse_counts \
      --gtf-annotation-file ${gtf_file} \
      --cell-barcode-tag CB \
      --molecule-barcode-tag UB \
      --gene-id-tag GE

done;
