output=$1
bam_input=${output}/merged.bam
size_in_mb=1024.0
#size_in_mb=60.0

SplitBam \
      --bamfile ${bam_input} \
      --output-prefix ${output}/subfile \
      --subfile-size ${size_in_mb} \
      --tag CB --tag CR
  
