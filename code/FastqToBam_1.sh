#/bin/bash
#r1_fastq=../pbmc_4k_in/fastqs/pbmc4k_S1_L001_R1_001.fastq.gz


output=$1
r2_fastq=$2

#r1_fastq=input1/zarr_S1_L001_R1_001.fastq.gz
java -Xmx3000m -jar /usr/picard/picard.jar FastqToSam \
      FASTQ=${r2_fastq} \
      SORT_ORDER=unsorted \
      OUTPUT=${output}/bamfile.bam \
      SAMPLE_NAME='testsamp1'
