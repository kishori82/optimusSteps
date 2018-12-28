
output=$1
bam_input=${output}/gene-sorted.bam


CalculateGeneMetrics -i ${bam_input} -o ${output}/gene-metrics.csv.gz
