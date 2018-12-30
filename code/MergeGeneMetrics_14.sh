#!/bin/bash
output=$1
metric_files=`ls ${output}/subfolder_*/gene-metrics.csv.gz`

MergeGeneMetrics -o ${output}/merged-gene-metrics.csv.gz  ${metric_files}

