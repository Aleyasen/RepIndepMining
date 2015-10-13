#!/bin/bash

folder1=$1
folder2=$2
alg=$3
qcount=50

echo --------------------------------
echo top-20
for((i=1; i<=${qcount}; i++))
do
	java -jar ./sim_kendall_half.jar ${folder1}/${alg}/answer.query${i}.txt ${folder2}/${alg}/answer.query${i}.txt 20
done

echo --------------------------------
echo top-10
for((i=1; i<=${qcount}; i++))
do
	java -jar ./sim_kendall_half.jar ${folder1}/${alg}/answer.query${i}.txt ${folder2}/${alg}/answer.query${i}.txt 10
done

echo --------------------------------
echo top-5
for((i=1; i<=${qcount}; i++))
do
	java -jar ./sim_kendall_half.jar ${folder1}/${alg}/answer.query${i}.txt ${folder2}/${alg}/answer.query${i}.txt 5
done

echo --------------------------------
echo top-3
for((i=1; i<=${qcount}; i++))
do
	java -jar ./sim_kendall_half.jar ${folder1}/${alg}/answer.query${i}.txt ${folder2}/${alg}/answer.query${i}.txt 3
done