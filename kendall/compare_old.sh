#!/bin/bash

folder1=$1
folder2=$2
alg=$3

echo --------------------------------
echo top50
for((i=1; i<=50; i++))
do
	java -jar ./sim_kendall_old.jar ${folder1}/${alg}/answer.query${i}.txt ${folder2}/${alg}/answer.query${i}.txt 50
done

echo --------------------------------
echo top10
for((i=1; i<=50; i++))
do
	java -jar ./sim_kendall_old.jar ${folder1}/${alg}/answer.query${i}.txt ${folder2}/${alg}/answer.query${i}.txt 10
done

echo --------------------------------
echo top5
for((i=1; i<=50; i++))
do
	java -jar ./sim_kendall_old.jar ${folder1}/${alg}/answer.query${i}.txt ${folder2}/${alg}/answer.query${i}.txt 5
done