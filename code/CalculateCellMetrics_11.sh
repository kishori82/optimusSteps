
output=$1
bam_input=${output}/cell-sorted.bam
CalculateCellMetrics -i ${bam_input} -o ${output}/cell-metrics.csv.gz
