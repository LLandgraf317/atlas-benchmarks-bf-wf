#!/bin/bash

if [ $# -gt 0 ]; then
	policy=$1
else
	policy="default"
fi

deadline=8360
count=0
tmpdeadline=7

while [ $tmpdeadline -le 9 ];
do
	count=0
	while [ $count -lt 10 ]; 
	do
		sh testansensors.sh $policy $(bc <<< "$tmpdeadline * $deadline")
		count=$((count + 1)) 
	done
	tmpdeadline=$((tmpdeadline + 1))
	#tmpdeadline=7
	#echo "ZÃhler: "$tmpdeadline
done

#count=0
#while [ $count -lt 20 ];
#do 
#	sh testansensors.sh $policy 235
#	count=$((count + 1))
#done
