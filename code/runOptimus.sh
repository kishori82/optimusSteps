#/bin/bash

input=$1
output=$2

 r1_fastq=`ls ${input}/*_R1_*.fastq.gz 2> /dev/null`  ||  echo "no file with Reads 1" 
 r2_fastq=`ls ${input}/*_R2_*.fastq.gz 2> /dev/null`  ||  echo "no file with Reads 2" 
 i1_fastq=`ls ${input}/*_I1_*.fastq.gz 2> /dev/null`  ||  echo "no file with Index 1" 

if [ -z "${r1_fastq}" ] || [ -z "${r2_fastq}" ] || [ -z "${i1_fastq}" ] ; then
   return 
fi

echo $r1_fastq
echo $r2_fastq
echo $i1_fastq

echo "1. FastqtoBam"
time code/FastqToBam_1.sh ${output}  ${r2_fastq} 2> /dev/null

echo "2. AttachBarcodes"
time code/AttachBarcodes_2.sh ${output} ${r1_fastq} ${i1_fastq} 2> /dev/null

echo "3. MergeSortBamFiles"
time code/MergeSortBamFiles_3.sh ${output} 2> /dev/null

echo "4. SplitBamByCellBarcode"
time code/SplitBamByCellBarcode_4.sh ${output} 2> /dev/null

echo "5. StarAlignedBamSingleEnd"
time code/StarAlignedBamSingleEnd_5.sh ${output} 2> /dev/null
 
echo "6. TagGenes"
time code/TagGenes_6.sh ${output} 2> /dev/null
 
echo "7. SortAndCorrectUmiMarkDuplicates"
time code/SortAndCorrectUmiMarkDuplicates_7.sh ${output} 2> /dev/null
 
echo "8. GeneSortBam"
time code/GeneSortBam_8.sh ${output} 2> /dev/null
 
echo "9. CellSortBam"
time code/CellSortBam_9.sh ${output} 2> /dev/null
 
echo "10. CalculateGeneMetrics"
time code/CalculateGeneMetrics_10.sh ${output} 2> /dev/null
 
echo "11. CalculateCellMetrics"
time code/CalculateCellMetrics_11.sh ${output} 2> /dev/null
 
echo "12. CreateSparseCountMatrix"
time code/CreateSparseCountMatrix_12.sh ${output} 2> /dev/null
