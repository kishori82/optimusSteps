output=$1
bam_input=output/bam_with_gene_exon.bam
machine_mem_mb=7500
# give the command 500MB of overhead
command_mem_mb=$(( ${machine_mem_mb}-500 ))


java -Xmx${command_mem_mb}m -jar /usr/picard/picard.jar SortSam \
      SORT_ORDER=coordinate \
      I=${bam_input} \
      O=${output}/sorted.bam

# recover disk space
#rm ${bam_input}

java -Xmx${command_mem_mb}m -jar /usr/picard/picard.jar UmiAwareMarkDuplicatesWithMateCigar \
      MAX_EDIT_DISTANCE_TO_JOIN=1 \
      UMI_METRICS_FILE=${output}/umi_metrics.txt \
      UMI_TAG_NAME=UR \
      ASSIGNED_UMI_TAG=UB \
      BARCODE_TAG=CB \
      METRICS_FILE=${output}/duplicate_metrics.txt \
      OUTPUT=${output}/duplicates_marked.bam \
      INPUT=${output}/sorted.bam
