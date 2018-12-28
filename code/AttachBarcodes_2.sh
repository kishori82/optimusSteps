
#r1_fastq=../pbmc_4k_in/fastqs/pbmc4k_S1_L001_R1_001.fastq.gz
#i1_fastq=../pbmc_4k_in/fastqs/pbmc4k_S1_L001_I1_001.fastq.gz

#r1_fastq=input1/zarr_S1_L001_R1_001.fastq.gz
#i1_fastq=input1/zarr_S1_L001_I1_001.fastq.gz
output=$1
r1_fastq=$2
i1_fastq=$3

whitelist=/mnt/data1/cellranger-2.2.0/cellranger-cs/2.2.0/lib/python/cellranger/barcodes/737K-august-2016.txt
r2_unmapped_bam=${output}/bamfile.bam

Attach10xBarcodes \
      --r1 ${r1_fastq} \
      --i1  ${i1_fastq} \
      --u2 ${r2_unmapped_bam} \
      --output-bamfile ${output}/barcoded.bam \
      --whitelist ${whitelist}
