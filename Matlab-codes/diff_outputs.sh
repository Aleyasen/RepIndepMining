#!/bin/bash

folder1=$1
folder2=$2
alg=$3

for((i=1; i<=100; i++))
do
	diff ${folder1}/${alg}/answer.query${i}.txt ${folder2}/${alg}/answer.query${i}.txt
done
