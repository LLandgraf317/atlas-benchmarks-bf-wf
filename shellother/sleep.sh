#!/bin/bash

echo 1 > /sys/bus/i2c/drivers/INA231/0-0040/enable

sleep 1

tmpb=$(date "+%s.%N")
cat /sys/bus/i2c/drivers/INA231/0-0040/sensor_J > /dev/null
tmpe=$(date "+%s.%N")

../smartdroid -a start
begin=$(date "+%s.%N")
preA15J=`cat /sys/bus/i2c/drivers/INA231/0-0040/sensor_J`

sleep 600 

A15J=`cat /sys/bus/i2c/drivers/INA231/0-0040/sensor_J`
end=$(date "+%s.%N")
../smartdroid -a stop

energyAll=`../smartdroid -m energy`

energy=$(bc <<< "$A15J - $preA15J")
seconds=$(bc <<< "$end - $begin")
echo "Sekunden: "$seconds"s"
echo "Energie: "$energy"J"
echo "Durchschnittliche Leistungsaufnahme: "$(bc <<< "$energy / $seconds")"W"
echo "Duchschn. Gesamtaufnahme: "$(bc <<< "$energyAll * 3600.0/$seconds")"W"

echo "Gesamtenergie: "$(bc <<< "$energyAll * 3600.0")"J"
echo "Zeit fuer eine Messung: "$(bc <<< "$tmpe - $tmpb")
