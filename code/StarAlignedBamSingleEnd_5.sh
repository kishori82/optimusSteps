#!/bin/bash

output=$1
echo "output "${output}
echo "bam inputs" ${bam_inputs[@]}

bam_inputs=`ls ${output}/subfile_*`
genome_reference=/mnt/data2/reference/2.2.0/GRCh38/star
cpu=1


for bam_input in ${bam_inputs[@]}; do 
bam_folder=`echo  ${bam_input} | sed -e 's/subfile_/subfolder_/' -e s/\.bam$//g`
rm -rf ${bam_folder}
mkdir ${bam_folder}

/usr/bin/time -v  STAR \
      --runMode alignReads \
      --runThreadN ${cpu} \
      --genomeDir ${genome_reference} \
      --readFilesIn ${bam_input} \
      --outSAMtype BAM Unsorted \
      --outSAMmultNmax -1 \
      --outSAMattributes All \
      --outSAMunmapped Within \
      --readFilesType SAM SE \
      --readFilesCommand "samtools view -h" \
      --runRNGseed 777 \
      --outFileNamePrefix ${bam_folder}/
done
