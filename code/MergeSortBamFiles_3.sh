output=$1
sort_order=unsorted
compression_level=5
machine_mem_mb=7500
command_mem_mb=$(( $machine_mem_mb - 500 ))

java -Dsamjdk.compression_level=${compression_level} -Xms${command_mem_mb}m \
      -jar /usr/picard/picard.jar  MergeSamFiles \
      USE_THREADING=true \
      SORT_ORDER=${sort_order} \
      INPUT=${output}/barcoded.bam \
      OUTPUT=${output}/merged.bam 
