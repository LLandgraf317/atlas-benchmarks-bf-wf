#!/bin/bash

policy=$1

echo 1 > /sys/bus/i2c/drivers/INA231/0-0040/enable
echo 1 > /sys/bus/i2c/drivers/INA231/0-0041/enable
echo 1 > /sys/bus/i2c/drivers/INA231/0-0045/enable

sh disablecpu.sh

cpupower --cpu 1-4 frequency-set -u 1700MHz

NOW=`date`
if [ ! -d "results" ]; then
	mkdir results
fi

export ATLAS_BACKEND="ATLAS"

FILE="results/measure-"$ATLAS_BACKEND"-"$2$policy$(date "+-%Y-%B-%d-%H-%M-%S")
echo $FILE
touch $FILE


export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
sleep 2

cmd="/usr/bin/time --verbose matrixcalc/matrix_calc --schedule $1 --deadline $2"
search_pattern='SIGNAL'
output=/dev/stdout
TRASH="matrixcalc/trash"
touch $TRASH

$cmd >> $TRASH &
tail -f -n1 $TRASH | grep -q $search_pattern


./smartdroid -a start
echo 'WRITING TO FILE'
begin=$(date "+%s.%N")
#echo $cmd >> $FILE
#echo "A15_J;A7_J;MEM_J" >> $FILE

preA15J=`cat /sys/bus/i2c/drivers/INA231/0-0040/sensor_J`
preA7_J=`cat /sys/bus/i2c/drivers/INA231/0-0045/sensor_J`
preMEM_J=`cat /sys/bus/i2c/drivers/INA231/0-0041/sensor_J`

#cmd="NPB3.3.1/NPB3.3-OMP/bin/ep.A.x"

#CPU_GOVERNOR='cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor'

#no tmu, please research, responsible for measuring temperatures

#IFS=read -ru ${bench[0]}

wait

A15_J=`cat /sys/bus/i2c/drivers/INA231/0-0040/sensor_J`
A7_J=`cat /sys/bus/i2c/drivers/INA231/0-0045/sensor_J`
MEM_J=`cat /sys/bus/i2c/drivers/INA231/0-0041/sensor_J`

end=$(date "+%s.%N")
./smartdroid -a stop

resultOver=`./smartdroid -m energy`
resultMEMJ=$(bc <<< "$MEM_J - $preMEM_J")
resultA15J=$(bc <<< "$A15_J - $preA15J")
resultA7J=$(bc <<< "$A7_J - $preA7_J")
#write results

echo "$resultA15J;$resultA7J;$resultMEMJ" >> $FILE
seconds=$(bc <<< "$end - $begin")
#nano=$(bc <<< "$endn - $beginn")
#if [ $nano -lt 0 ]; then
#	seconds=$(bc <<< "$seconds - 1")
#	nano=$(bc <<< "- $nano")	
#fi
echo "$seconds" >> $FILE
echo "$resultOver" >> $FILE
equalsNull=$(bc <<< "$resultOver == 0")
if [ $equalsNull -eq 1 ]; then
	echo "File deleted! Energy was 0"
	rm $FILE
fi
lowerNull=$(bc <<< "$resultA15J < 0")
if [ $lowerNull -eq 1 ]; then
	echo "File deleted! Core energy corrupted"
	rm $FILE
fi
sleep 0.1
#done
