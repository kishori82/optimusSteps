#!/bin/bash
output=$1
count_files=`ls ${output}/subfolder_*/sparse_counts.npz`

prefixes=`echo  ${count_files} | sed -e 's/\.npz//g'`


MergeCountMatrices -o ${output}/sparse_counts -i ${prefixes}

