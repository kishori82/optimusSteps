#!/bin/bash

output=$1
sort_order=coordinate
compression_level=5
machine_mem_mb=7500
command_mem_mb=$(( $machine_mem_mb - 500 ))

bam_inputs=`ls ${output}/subfolder_*/duplicates_marked.bam`
bam_inputs=`echo ${bam_inputs} | sed -e 's/ / INPUT=/g'`


java -Dsamjdk.compression_level=${compression_level} -Xms${command_mem_mb}m \
      -jar /usr/picard/picard.jar  MergeSamFiles \
      USE_THREADING=true \
      SORT_ORDER=${sort_order} \
      INPUT=${bam_inputs} \
      OUTPUT=${output}/merged.bam 
