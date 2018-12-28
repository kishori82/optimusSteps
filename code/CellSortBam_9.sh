
output=$1
bam_input=${output}/gene-sorted.bam
TagSortBam -i ${bam_input} -o ${output}/cell-sorted.bam -t CB UB GE
