
output=$1
annotations_gtf=/mnt/data2/reference/2.2.0/GRCh38/genes/genes.gtf
bam_input=${output}/Aligned.out.bam


TagReadWithGeneExon \
      INPUT=${bam_input} \
      OUTPUT=${output}/bam_with_gene_exon.bam \
      SUMMARY=${output}/gene_exon_tag_summary.log \
      TAG=GE \
      ANNOTATIONS_FILE=${annotations_gtf}
