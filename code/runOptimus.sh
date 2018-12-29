#/bin/bash

input=$1
output=$2

 r1_fastq=`ls ${input}/*_R1_*.fastq.gz 2> /dev/null`  ||  /usr/bin/time -v "no file with Reads 1" 
 r2_fastq=`ls ${input}/*_R2_*.fastq.gz 2> /dev/null`  ||  /usr/bin/time -v "no file with Reads 2" 
 i1_fastq=`ls ${input}/*_I1_*.fastq.gz 2> /dev/null`  ||  /usr/bin/time -v "no file with Index 1" 

if [ -z "${r1_fastq}" ] || [ -z "${r2_fastq}" ] || [ -z "${i1_fastq}" ] ; then
   return 
fi

echo $r1_fastq
echo $r2_fastq
echo $i1_fastq

echo "1. FastqtoBam"
/usr/bin/time -v  code/FastqToBam_1.sh ${output}  ${r2_fastq} > /dev/null

echo "2. AttachBarcodes"
/usr/bin/time -v code/AttachBarcodes_2.sh ${output} ${r1_fastq} ${i1_fastq} > /dev/null

echo "3. MergeSortBamFiles"
/usr/bin/time -v code/MergeSortBamFiles_3.sh ${output} > /dev/null

echo "4. SplitBamByCellBarcode"
/usr/bin/time -v code/SplitBamByCellBarcode_4.sh ${output} > /dev/null

echo "5. StarAlignedBamSingleEnd"
/usr/bin/time -v code/StarAlignedBamSingleEnd_5.sh ${output} > /dev/null
 
echo "6. TagGenes"
/usr/bin/time -v code/TagGenes_6.sh ${output} > /dev/null
 
echo "7. SortAndCorrectUmiMarkDuplicates"
/usr/bin/time -v code/SortAndCorrectUmiMarkDuplicates_7.sh ${output} > /dev/null
 
echo "8. GeneSortBam"
/usr/bin/time -v code/GeneSortBam_8.sh ${output} > /dev/null
 
echo "9. CellSortBam"
/usr/bin/time -v code/CellSortBam_9.sh ${output} > /dev/null
 
echo "10. CalculateGeneMetrics"
/usr/bin/time -v code/CalculateGeneMetrics_10.sh ${output} > /dev/null
 
echo "11. CalculateCellMetrics"
/usr/bin/time -v code/CalculateCellMetrics_11.sh ${output} > /dev/null
 
echo "12. CreateSparseCountMatrix"
/usr/bin/time -v code/CreateSparseCountMatrix_12.sh ${output} > /dev/null
