
output=$1
bam_input=${output}/cell-sorted.bam
gtf_file=/mnt/data2/reference/2.2.0/GRCh38/genes/genes.gtf

CreateCountMatrix \
      --bam-file ${bam_input} \
      --output-prefix ${output}/sparse_counts \
      --gtf-annotation-file ${gtf_file} \
      --cell-barcode-tag CB \
      --molecule-barcode-tag UB \
      --gene-id-tag GE

