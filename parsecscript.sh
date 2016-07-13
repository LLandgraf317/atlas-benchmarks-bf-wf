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

export ATLAS_BACKEND="NONE"
count=8

FILE="results/parsec/measure-"$ATLAS_BACKEND"-parsec-"$count$policy$(date "+-%Y-%B-%d-%H-%M-%S")
echo $FILE
touch $FILE

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
sleep 2

cmd="/usr/bin/time --verbose make run"
output=/dev/stdout

./smartdroid -a start
echo "Starting benchmark"
begin=$(date "+%s.%N")
preA15J=`cat /sys/bus/i2c/drivers/INA231/0-0040/sensor_J`
preA7_J=`cat /sys/bus/i2c/drivers/INA231/0-0045/sensor_J`
preMEM_J=`cat /sys/bus/i2c/drivers/INA231/0-0041/sensor_J`
cd ../parsec
$cmd &
$cmd &
$cmd &
$cmd &
$cmd &
$cmd &
$cmd &
$cmd &
cd ../atlas-benchmarks
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
resTime=$(bc <<< "$end - $begin")
#write results

echo "$resultA15J;$resultA7J;$resultMEMJ" >> $FILE
echo "$resTime" >> $FILE
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
