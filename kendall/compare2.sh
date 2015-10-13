#!/bin/bash

folder1=$1
folder2=$2
alg=$3

echo --------------------------------
echo top50
for((i=1; i<=50; i++))
do
	head -n1 ${folder1}/${alg}/answer.query${i}.txt
	head -n1 ${folder2}/${alg}/answer.query${i}.txt
	echo ---------------------------
done
