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
code/FastqToBam_1.sh ${output}  ${r2_fastq} 2> /dev/null

echo "2. AttachBarcodes"
code/AttachBarcodes_2.sh ${output} ${r1_fastq} ${i1_fastq} 2> /dev/null

echo "3. MergeSortBamFiles"
code/MergeSortBamFiles_3.sh ${output} 2> /dev/null

echo "4. SplitBamByCellBarcode"
code/SplitBamByCellBarcode_4.sh ${output} 2> /dev/null

echo "5. StarAlignedBamSingleEnd"
code/StarAlignedBamSingleEnd_5.sh ${output} 2> /dev/null
 
echo "6. TagGenes"
code/TagGenes_6.sh ${output} 2> /dev/null
 
echo "7. SortAndCorrectUmiMarkDuplicates"
code/SortAndCorrectUmiMarkDuplicates_7.sh ${output} 2> /dev/null
 
echo "8. GeneSortBam"
code/GeneSortBam_8.sh ${output} 2> /dev/null
 
echo "9. CellSortBam"
code/CellSortBam_9.sh ${output} 2> /dev/null
 
echo "10. CalculateGeneMetrics"
code/CalculateGeneMetrics_10.sh ${output} 2> /dev/null
 
echo "11. CalculateCellMetrics"
code/CalculateCellMetrics_11.sh ${output} 2> /dev/null
 
echo "12. CreateSparseCountMatrix"
code/CreateSparseCountMatrix_12.sh ${output} 2> /dev/null
