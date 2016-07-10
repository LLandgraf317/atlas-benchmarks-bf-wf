import fnmatch
import os
from statistics import *

timelist = []
a15list = []
a7list = []
memlist = []

def openAndPrint(file,a15list,a7list,memlist,timelist,overlist):
    with open(file) as f:
        lines = f.readlines()
	
        arr = lines[0].split(';')
        if(float(arr[0])>0):
            a15list.append(float(arr[0]))
            a7list.append(float(arr[1]))
            memlist.append(float(arr[2]))
            timelist.append(float(lines[1]))
            overlist.append(float(lines[2]))
	

def averageOfList(li):
    res = 0
    for i in li:
        res += float(i)
    return res/(len(li))

def compareBySchedule(deadline):
    res = ""
    for i in range(4,10):
       bestA15List = []
       worstA15List = []

       bestTimeList = []
       worstTimeList = []

       bestAllList = []
       worstAllList = []
       for file in os.listdir('.'):
           if fnmatch.fnmatch(file,'measure-ATLAS-'+str(deadline*i)+'BESTDIS*') and os.stat(file).st_size > 0:
               openAndPrint(file,bestA15List,[],[],bestTimeList,bestAllList)
           if fnmatch.fnmatch(file,'measure-ATLAS-'+str(deadline*i)+'WORSTDIS*') and os.stat(file).st_size > 0:
               openAndPrint(file,worstA15List,[],[],worstTimeList,worstAllList)
       timeBest = mean(bestTimeList)
       timeWorst = mean(worstTimeList)
       bestA15 = mean(bestA15List)
       worstA15 = mean(worstA15List)
       bestAll = mean(bestAllList)
       worstAll = mean(worstAllList)
       averageIdleDraw = 0.4710721
       
       paddingTime = timeBest - timeWorst
       padWorstA15 = worstA15 + paddingTime * averageIdleDraw
       padWorstAll = worstAll + paddingTime * averageAll
       
       string = '(' + str(i*deadline) + ','+ str(padWorstA15) + ') '
       res = res * string
        

def printByPattern(pattern):
    a15list = []
    a7list = []
    memlist = []
    timelist = []
    overlist = []

    print(pattern)

    for file in os.listdir('.'):
        if fnmatch.fnmatch(file, pattern):
            if os.stat(file).st_size > 0:
                openAndPrint(file,a15list,a7list,memlist,timelist,overlist)
    print('Menge: ' + str(len(a15list)))
    print(str(averageOfList(a15list)) + 'J fuer A15')
    print(str(stdev(a15list)) + ' Standardabweichung')
    print(str(averageOfList(a7list)) + 'J fuer A7')
    print(str(averageOfList(memlist)) + 'J fuer MEM')
    print(str(averageOfList(timelist)) + ' Sekunden')
    print(str(stdev(timelist)) + ' Standardabweichung')
    print(str(mean(overlist)*3600.0) + 'J Gesamtverbrauch') 
    print()

printByPattern('measure-NONE-0default-*')
printByPattern('measure-ATLAS-235WORSTDIS-*')

deadline = 2350
for i in range(1,10):
	printByPattern('measure-ATLAS-'+str(deadline*i)+'WORSTDIS*')
printByPattern('measure-ATLAS-235BESTDIS-*')
for i in range(1,10):
	printByPattern('measure-ATLAS-'+str(deadline*i)+'BESTDIS*')
#printByPattern('measure-ATLAS-BEST-*')

deadline = 8360
for i in range(4,10):
	printByPattern('measure-ATLAS-'+str(deadline*i)+'BEST225*')
for i in range(4,10):
	printByPattern('measure-ATLAS-'+str(deadline*i)+'WORST225*')


compareBySchedule(2350)
