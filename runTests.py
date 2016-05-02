import sys
from OMPython import OMCSession

# List of the test examples that will be checked

test_list = ["OpenIPSL.Examples.Machines.PSSE.GENSAL",
             "OpenIPSL.Examples.Machines.PSSE.GENSAE",
             "OpenIPSL.Examples.Machines.PSSE.GENROE",
             "OpenIPSL.Examples.Machines.PSSE.GENROU"]


omc = OMCSession()
omc.sendExpression("loadModel(Modelica)")
b = omc.sendExpression('loadFile("/OpenIPSL/OpenIPSL/package.mo")')
a = omc.sendExpression("getClassNames()")


stopTime = 10
outputInterval = 0.001
method = 'Rkfix2'

for test in test_list:
    c = omc.sendExpression("checkModel(%s)" % (test))
    print c
