output=$1
bam_inputs=${output}/subfile_*
genome_reference=/mnt/data2/reference/2.2.0/GRCh38/star
cpu=1

for bam_input in ${bam_inputs[@]}; do 
# prepare reference
STAR \
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
      --outFileNamePrefix ${output}/
done
