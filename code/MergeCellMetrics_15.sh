#!/bin/bash
output=$1
metric_files=`ls ${output}/subfolder_*/cell-metrics.csv.gz`

MergeCellMetrics -o ${output}/merged-cell-metrics.csv.gz  ${metric_files}

