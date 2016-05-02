import sys
from OMPython import OMCSession

# List of the test examples that will be checked

omc = OMCSession()
omc.sendExpression("loadModel(Modelica)")
omc.sendExpression('loadFile("/OpenIPSL/OpenIPSL/package.mo")')
omc.sendExpression("getClassNames()")
'''
test_list = ["OpenIPSL.Examples.Machines.PSSE.GENSAL",
             "OpenIPSL.Examples.Machines.PSSE.GENSAE",
             "OpenIPSL.Examples.Machines.PSSE.GENROE",
             "OpenIPSL.Examples.Machines.PSSE.GENROU"]
'''


# Get the list of all test cases in class DevelopmentExamples
test_list = omc.sendExpression('getClassNames(OpenIPSL,recursive=true)')
nFailed = 0
nPassed = 0

for test in test_list:
    if omc.sendExpression("isModel(%s)" % (test)):
        passMsg = omc.sendExpression("checkModel(%s)" % (test))
        failMsg = omc.sendExpression("getErrorString()")
        if not failMsg:
            print passMsg
            nPassed += 1
        else:
            print "Model %s failed to check!" % (test)
            nFailed += 1

if nPassed:
    sys.exit(1)
