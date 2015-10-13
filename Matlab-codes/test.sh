#!/bin/bash

folder1=$1
folder2=$2
alg=$3
algfolder=$(echo $alg | tr '[:upper:]' '[:lower:]')
algname=$(echo $alg | tr '[:lower:]' '[:upper:]')

echo --------------------------------
echo top50
for((i=1; i<=50; i++))
do
	java -jar ./sim_kendall.jar ${folder1}/${algfolder}/query${i}-${algname}.txt ${folder2}/${algfolder}/query${i}-${algname}.txt 50
done

echo --------------------------------
echo top10
for((i=1; i<=50; i++))
do
	java -jar ./sim_kendall.jar ${folder1}/${algfolder}/query${i}-${algname}.txt ${folder2}/${algfolder}/query${i}-${algname}.txt 10
done

echo --------------------------------
echo top5
for((i=1; i<=50; i++))
do
	java -jar ./sim_kendall.jar ${folder1}/${algfolder}/query${i}-${algname}.txt ${folder2}/${algfolder}/query${i}-${algname}.txt 5
done