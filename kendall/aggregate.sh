#!/bin/bash

qcount=100;
sum50=0.0;
sum10=0;
sum5=0;

read temp
read temp
for((i=1; i<=${qcount}; i++))
do
	read num;
	#sum50=$(awk 'BEGIN{print $sum50+$num}');
	#echo $num;
	#echo 'sum '+ $sum50
done
echo $sum50;