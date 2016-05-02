
from OMPython import OMCSession

# List of the test examples that will be checked

test_list = ["iPSL.Examples.Machines.PSSE.GENSAL"]


omc = OMCSession()
omc.sendExpression("loadModel(Modelica)")

stopTime = 10
outputInterval = 0.001
method = 'Rkfix2'

print "Running some tests"
