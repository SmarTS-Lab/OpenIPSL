import sys
import os
from OMPython import OMCSession


class CITests():
    '''
    Python class used to run CI tests
    '''
    def __init__(self, rootPath):
        '''
        Constructor starts omc and loads MSL
        '''
        self.rootPath = rootPath
        self.omc = OMCSession()
        os.chdir(self.rootPath)
        self.omc.sendExpression("loadModel(Modelica)")


    def loadLib(self, libPath):
        # Attempt to load the library
        if self.omc.sendExpression('loadFile("%s")' % (self.rootPath + libPath)):
            print "%s is successfully loaded." % libPath
        else:
            raise Exception("%s was not loaded! Check the library path.")  % libPath

    def runCheck(self, libName, libPath):
        # Load library
        self.loadLib(libPath)
        '''
        Checks all of the models in the library and returns number of faild checks
        '''
        # Get the list of all classes in OpenIPSL
        test_list = self.omc.sendExpression('getClassNames(%s,recursive=true)' % libName)
        nFailed = 0
        nPassed = 0

        # Run the check for all classes that are model and print result msgs
        for test in test_list:
            if self.omc.sendExpression("isModel(%s)" % (test)):  # Check if a class is a model
                passMsg = self.omc.sendExpression("checkModel(%s)" % (test))
                if "completed successfully." in passMsg:
                    # print passMsg
                    nPassed += 1
                else:
                    failMsg = self.omc.sendExpression("getErrorString()")
                    print failMsg
                    nFailed += 1
        # Print a check summary
        print "==== Check Summary for %s ===="  % libName
        print "Number of models that passed the check is: %s" % nPassed
        print "Number of models that failed the check is: %s" % nFailed
        return (nFailed == 0)

# Instance of CITests
ci = CITests("/OpenIPSL")
# Run Check on OpenIPSL
passLib = ci.runCheck("OpenIPSL","/OpenIPSL/package.mo")

# Libs in Application Examples
notPassAppEx = 0
appExamples = {
"KundurSMIB":"/ApplicationExamples/KundurSMIB/package.mo",
"TwoAreas":"/ApplicationExamples/TwoAreas/package.mo",
"SevenBus":"/ApplicationExamples/SevenBus/package.mo",
"IEEE9":"/ApplicationExamples/IEEE9/package.mo",
"IEEE14":"/ApplicationExamples/IEEE14/package.mo",
"AKD":"/ApplicationExamples/AKD/package.mo",
"N44":"/ApplicationExamples/N44/package.mo",
"OpenCPSD5d3B":"/ApplicationExamples/OpenCPSD5d3B/package.mo",
"RaPIdExperiments":"/ApplicationExamples/RaPIdExperiments/package.mo"
}

for package in appExamples.keys():
    notPassAppEx = notPassAppEx + (not ci.runCheck(package,appExamples[package]))


# The tests are failing if the number of failed check > 0
if (not passLib) or notPassAppEx :
    sys.exit(1)
