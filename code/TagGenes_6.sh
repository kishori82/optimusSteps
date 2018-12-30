#!/bin/bash
output=$1
annotations_gtf=/mnt/data2/reference/2.2.0/GRCh38/genes/genes.gtf

bam_inputs=`ls ${output}/subfile_*`

for bam_input in ${bam_inputs[@]}; do 
bam_folder=`echo  ${bam_input} | sed -e 's/subfile_/subfolder_/' -e s/\.bam$//g`
bam_input=${bam_folder}/Aligned.out.bam

/usr/bin/time -v TagReadWithGeneExon \
      INPUT=${bam_input} \
      OUTPUT=${bam_folder}/bam_with_gene_exon.bam \
      SUMMARY=${bam_folder}/gene_exon_tag_summary.log \
      TAG=GE \
      ANNOTATIONS_FILE=${annotations_gtf}
done;
