#!/bin/bash

if [ $# -gt 0 ]; then
	policy=$1
else
	policy="default"
fi

count=0
while [ $count -lt 10 ]; 
do
	sh parsecscript.sh $policy 
	count=$((count + 1)) 
done

#count=0
#while [ $count -lt 20 ];
#do 
#	sh testansensors.sh $policy 235
#	count=$((count + 1))
#done
