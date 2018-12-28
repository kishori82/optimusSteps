output=$1
bam_input=${output}/duplicates_marked.bam

TagSortBam -i ${bam_input} -o ${output}/gene-sorted.bam -t GE CB UB

