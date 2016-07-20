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

def compareBySchedule(deadline,suffix,withStdDev):
    resEW = ""
    resEB = ""
    resEWP = ""
    resEWE = "" #dont ask, just dont
    resEWEP = ""

    resW = ""
    resB = ""
    resWP = ""
    resWE = ""
    resWEP = ""

    for i in range(4,10):
       bestA15List = []
       worstA15List = []

       bestTimeList = []
       worstTimeList = []

       bestAllList = []
       worstAllList = []
       for file in os.listdir('.'):
           if fnmatch.fnmatch(file,'measure-ATLAS-'+str(deadline*i)+'BEST'+suffix+'*') and os.stat(file).st_size > 0:
               openAndPrint(file,bestA15List,[],[],bestTimeList,bestAllList)
           if fnmatch.fnmatch(file,'measure-ATLAS-'+str(deadline*i)+'WORST'+suffix+'*') and os.stat(file).st_size > 0:
               openAndPrint(file,worstA15List,[],[],worstTimeList,worstAllList)

       timeBest = mean(bestTimeList)
       timeWorst = mean(worstTimeList)
       bestA15 = mean(bestA15List)
       worstA15 = mean(worstA15List)
       bestAll = mean(bestAllList)*3600
       worstAll = mean(worstAllList)*3600

       averageIdleDraw = 0.4710721
       averageAll = 3.11394186
       paddingTime = timeBest - timeWorst
       padWorstA15 = worstA15 + paddingTime * averageIdleDraw
       padWorstAll = worstAll + paddingTime * averageAll
       
       effectiveDeadline = i*deadline/1000
       ddln = str(effectiveDeadline)

       energyBest = '(' + ddln + ',' + str("%.3f"%(bestA15)) + ') '
       energyWorst = '(' + ddln + ',' + str("%.3f"%(worstA15)) + ') '
       energyPadWorst = '(' + ddln + ','+ str("%.3f"%(padWorstA15)) + ') '
       energyWorstAll = '(' + ddln + ','+ str("%.3f"%(worstAll)) + ') '
       energyPadWorstAll = '(' + ddln + ','+ str("%.3f"%(padWorstAll)) + ') '
       
       best = '(' + ddln + ',' + str("%.3f"%(bestA15/(i*deadline/1000))) + ') '
       worst = '(' + ddln + ',' + str("%.3f"%(worstA15/(i*deadline/1000))) + ') '
       string = '(' + ddln + ','+ str("%.3f"%(padWorstA15/(i*deadline/1000))) + ') '
       strWorstAll = '(' + ddln + ','+ str("%.3f"%(worstAll/(i*deadline/1000))) + ') '
       strPadWorstAll = '(' + ddln + ','+ str("%.3f"%(padWorstAll/(i*deadline/1000))) + ') '

       resEB = resEB + energyBest
       resEW = resEW + energyWorst
       resEWP = resEWP + energyPadWorst
       resEWE = resEWE + energyWorstAll
       resEWEP = resEWEP + energyPadWorstAll

       resB = resB + best
       resW = resW + worst
       resWP = resWP + string
       resWE = resWE + strWorstAll
       resWEP = resWEP + strPadWorstAll
    prefix = "Energie fuer "
    strBf = "Best-Fit: "
    strWf = "Worst-Fit: "
    strWfP = "Worst-Fit mit Idle-Padding: "
    strWfE = "Worst-Fit fuer das ganze System: "
    strWfEP = "Worst-Fit fuer das ganze System mit Idle-Padding: "
    print(prefix + strBf)
    print(resEB)
    print(prefix + strWf)
    print(resEW)
    print(prefix + strWfP)
    print(resEWP)
    print(prefix + strWfE)
    print(resEWE)
    print(prefix + strWfEP)
    print(resEWEP)

    print("Power fuer Best-Fit: ")
    print(resB)
    print("Power fuer Worst-Fit: ")
    print(resW)
    print("Power fuer Worst-Fit mit Idle-Padding: ")
    print(resWP)
    print("Power fuer Worst-Fit fuer das ganze System: ")
    print(resWE)
    print("Power fuer Worst-Fit fuer das ganze System mit Idle-Padding: ")
    print(resWEP)
        

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

printByPattern('measure-NONE-parsec-2default-*')
printByPattern('measure-ATLAS-parsec-2BESTMP250-*')
printByPattern('measure-ATLAS-parsec-2WORSTMP250-*')
printByPattern('measure-NONE-parsec-4default-*')
printByPattern('measure-ATLAS-parsec-4BESTMP250-*')
printByPattern('measure-ATLAS-parsec-4WORSTMP250-*')
printByPattern('measure-ATLAS-parsec-4BESTMP*')
printByPattern('measure-ATLAS-parsec-4WORSTMP*')#
printByPattern('measure-NONE-parsec-8default-*')
printByPattern('measure-ATLAS-parsec-8BESTMP-*')
printByPattern('measure-ATLAS-parsec-8WORSTMP-*')

#compareBySchedule(2350,'DIS',False)
