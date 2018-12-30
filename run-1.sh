#!/bin/bash


s=1; 
for i in `seq 1 20`; do 
   echo "==:"$s
   #mkdir  out${s}k
   .  code/runOptimus.sh  /mnt/data2/utils/input/in${s}k/ out${s}k
   s=$(( $s*2 )); 

done;

