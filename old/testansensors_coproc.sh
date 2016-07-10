#!/bin/bash

policy=$1

echo 1 > /sys/bus/i2c/drivers/INA231/0-0040/enable
echo 1 > /sys/bus/i2c/drivers/INA231/0-0041/enable
echo 1 > /sys/bus/i2c/drivers/INA231/0-0045/enable

NOW=`date`
if [ ! -d "results" ]; then
	mkdir results
fi


FILE="results/measure-"$policy$(date "+-coproc-%Y-%B-%d-%H-%M")
echo $FILE
touch $FILE


sleep 2

echo "A15_J;A7_J;MEM_J" >> $FILE
preA15J=`cat /sys/bus/i2c/drivers/INA231/0-0040/sensor_J`
preA7_J=`cat /sys/bus/i2c/drivers/INA231/0-0045/sensor_J`
preMEM_J=`cat /sys/bus/i2c/drivers/INA231/0-0041/sensor_J`

#proc="ep.A.x"
#path="NPB3.3.1/NPB3.3-OMP/bin/"

proc="matrix_bench"
path="matrixcalc/"

$path$proc &
#coproc benchmark { $path$proc ;} 

while true; do

#CPU0_FREQ=$((`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq`/1000))" Mhz"
#CPU1_FREQ=$((`cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq`/1000))" Mhz"
#CPU2_FREQ=$((`cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_cur_freq`/1000))" Mhz"
#CPU3_FREQ=$((`cat /sys/devices/system/cpu/cpu3/cpufreq/scaling_cur_freq`/1000))" Mhz"
#CPU4_FREQ=$((`cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_cur_freq`/1000))" Mhz"
#CPU5_FREQ=$((`cat /sys/devices/system/cpu/cpu5/cpufreq/scaling_cur_freq`/1000))" Mhz"
#CPU6_FREQ=$((`cat /sys/devices/system/cpu/cpu6/cpufreq/scaling_cur_freq`/1000))" Mhz"
#CPU7_FREQ=$((`cat /sys/devices/system/cpu/cpu7/cpufreq/scaling_cur_freq`/1000))" Mhz"

#CPU_GOVERNOR='cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor'

#no tmu, please research, responsible for measuring temperatures

#IFS= read -ru ${benchmark[0]} stdoutput; printf '%s\n' "$stdoutput"
if [ -z "$(pgrep $proc)" ]; then
	exit 0
fi

#A15 Cores
A15_J=`cat /sys/bus/i2c/drivers/INA231/0-0040/sensor_J`

#A7 Cores
A7_J=`cat /sys/bus/i2c/drivers/INA231/0-0045/sensor_J`

#Memory
MEM_J=`cat /sys/bus/i2c/drivers/INA231/0-0041/sensor_J`

resultMEMJ=$(bc <<< "$MEM_J - $preMEM_J")
resultA15J=$(bc <<< "$A15_J - $preA15J")
resultA7J=$(bc <<< "$A7_J - $preA7_J")
#write results

echo "$resultA15J;$resultA7J;$resultMEMJ" >> $FILE
sleep 1
done
