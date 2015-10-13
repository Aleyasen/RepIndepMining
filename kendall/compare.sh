#!/bin/bash

folder1=$1
folder2=$2
alg=$3
qcount = 100;

echo --------------------------------
echo top-50
for((i=1; i<=${qcount}; i++))
do
	java -jar ./sim_kendall.jar ${folder1}/${alg}/answer.query${i}.txt ${folder2}/${alg}/answer.query${i}.txt 50
done

echo --------------------------------
echo top-10
for((i=1; i<=${qcount}; i++))
do
	java -jar ./sim_kendall.jar ${folder1}/${alg}/answer.query${i}.txt ${folder2}/${alg}/answer.query${i}.txt 10
done

echo --------------------------------
echo top-5
for((i=1; i<=${qcount}; i++))
do
	java -jar ./sim_kendall.jar ${folder1}/${alg}/answer.query${i}.txt ${folder2}/${alg}/answer.query${i}.txt 5
done