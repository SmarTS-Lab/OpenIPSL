import os
from OMPython import OMCSessionZMQ

class CITests():
    '''
    Python class used to run CI tests
    '''
    def __init__(self, rootPath):
        '''
        Constructor starts omc and loads MSL
        '''
        self.rootPath = rootPath
        self.omc = OMCSessionZMQ()
        os.chdir(self.rootPath)
        self.omc.sendExpression("loadModel(Modelica)")


    def loadLib(self, libName, libPath):
        # Attempt to load the library
        if self.omc.sendExpression('loadFile("%s")' % (self.rootPath + libPath)):
            print "Load success: %s" % libName
        else:
            errmsg = libName + " was not loaded! Check the library path:\n" + libPath
            raise Exception(errmsg)

    def runSyntaxCheck(self, libName, libPath):
        # Load library
        self.loadLib(libName,libPath)
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
                    nPassed += 1
                else:
                    failMsg = self.omc.sendExpression("getErrorString()")
                    print failMsg
                    nFailed += 1
        # Print a check summary
        if nFailed == 0:
            str1 = "== %s ----------------------" % libName
            print "%s OK! == Models checked: %s" % (str1[:22], nPassed)
        else:
            print "==== Check Summary for %s ===="  % libName
            print "Number of models that passed the check is: %s" % nPassed
            print "Number of models that failed the check is: %s" % nFailed

        # Return test result
        return (nFailed == 0)
