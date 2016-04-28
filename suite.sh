#!/bin/bash

if [ $# -gt 0 ]; then
	policy=$1
else
	policy="default"
fi

sh testansensors.sh $policy
sh testansensors_coproc.sh $policy
