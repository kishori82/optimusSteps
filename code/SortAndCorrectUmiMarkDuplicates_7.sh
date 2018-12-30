#!/bin/bash
output=$1
machine_mem_mb=7500
# give the command 500MB of overhead
command_mem_mb=$(( ${machine_mem_mb}-500 ))

bam_inputs=`ls ${output}/subfile_*`

for bam_input in ${bam_inputs[@]}; do 
bam_folder=`echo  ${bam_input} | sed -e 's/subfile_/subfolder_/' -e s/\.bam$//g`
bam_input=${bam_folder}/bam_with_gene_exon.bam


/usr/bin/time -v java -Xmx${command_mem_mb}m -jar /usr/picard/picard.jar SortSam \
      SORT_ORDER=coordinate \
      I=${bam_input} \
      O=${bam_folder}/sorted.bam

# recover disk space
#rm ${bam_input}
/usr/bin/time -v  java -Xmx${command_mem_mb}m -jar /usr/picard/picard.jar UmiAwareMarkDuplicatesWithMateCigar \
      MAX_EDIT_DISTANCE_TO_JOIN=1 \
      UMI_METRICS_FILE=${bam_folder}/umi_metrics.txt \
      UMI_TAG_NAME=UR \
      ASSIGNED_UMI_TAG=UB \
      BARCODE_TAG=CB \
      METRICS_FILE=${bam_folder}/duplicate_metrics.txt \
      OUTPUT=${bam_folder}/duplicates_marked.bam \
      INPUT=${bam_folder}/sorted.bam
done;
