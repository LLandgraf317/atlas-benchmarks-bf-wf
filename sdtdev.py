import fnmatch
import os
from statistics import *

timelist = []
a15list = []
a7list = []
memlist = []

def openAndPrint(file,a15list,a7list,memlist,timelist):
    with open(file) as f:
        lines = f.readlines()
        arr = lines[0].split(';')
        a15list.append(float(arr[0]))
        a7list.append(float(arr[1]))
        memlist.append(float(arr[2]))
        timelist.append(float(lines[1]))

def averageOfList(li):
    res = 0
    for i in li:
        res += float(i)
    return res/(len(li))

def printByPattern(pattern):
    a15list = []
    a7list = []
    memlist = []
    timelist = []

    print(pattern)

    for file in os.listdir('.'):
        if fnmatch.fnmatch(file, pattern):
            openAndPrint(file,a15list,a7list,memlist,timelist)
    print('Menge: ' + str(len(a15list)))
    print(str(averageOfList(a15list)) + 'J fuer A15')
    print(str(stdev(a15list)) + ' Standardabweichung')
    print(str(averageOfList(a7list)) + 'J fuer A7')
    print(str(averageOfList(memlist)) + 'J fuer MEM')
    print(str(averageOfList(timelist)) + ' Sekunden')
    print(str(stdev(timelist)) + ' Standardabweichung')
    print()

#printByPattern('measure-NONE-*')
printByPattern('measure-ATLAS-WORST-2016-June-29-08*')
#printByPattern('measure-ATLAS-BEST-*')



