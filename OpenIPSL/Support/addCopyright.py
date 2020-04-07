# Apply Copyright in all .mo files of the library

import sys
import os
from OMPython import OMCSession

# Start OMC session and load MSL

omc = OMCSession()
omc.sendExpression("loadModel(Modelica)")

# Load OpenIPSL and get all models
omc.sendExpression('loadFile("C:\dev\OSS\OpenIPSL_Repo\OpenIPSL\package.mo")')
omc.sendExpression('loadFile("C:\dev\OSS\OpenIPSL_Repo\Application Examples\_Tutorial\Tutorial\package.mo")')
omc.sendExpression('loadFile("C:\dev\OSS\OpenIPSL_Repo\Application Examples\AKD\package.mo")')
omc.sendExpression('loadFile("C:\dev\OSS\OpenIPSL_Repo\Application Examples\IEEE9\package.mo")')
omc.sendExpression('loadFile("C:\dev\OSS\OpenIPSL_Repo\Application Examples\IEEE14\package.mo")')
omc.sendExpression('loadFile("C:\dev\OSS\OpenIPSL_Repo\Application Examples\KundurSMIB\package.mo")')
omc.sendExpression('loadFile("C:\dev\OSS\OpenIPSL_Repo\Application Examples\N44\package.mo")')
omc.sendExpression('loadFile("C:\dev\OSS\OpenIPSL_Repo\Application Examples\PSAT_Systems\package.mo")')
omc.sendExpression('loadFile("C:\dev\OSS\OpenIPSL_Repo\Application Examples\SevenBus\package.mo")')
omc.sendExpression('loadFile("C:\dev\OSS\OpenIPSL_Repo\Application Examples\TwoAreas\package.mo")')

list_models = omc.sendExpression('getClassNames(OpenIPSL,recursive=true)')
list_models_1 = omc.sendExpression('getClassNames(Tutorial,recursive=true)')
list_models_2 = omc.sendExpression('getClassNames(AKD,recursive=true)')
list_models_3 = omc.sendExpression('getClassNames(IEEE9,recursive=true)')
list_models_4 = omc.sendExpression('getClassNames(IEEE14,recursive=true)')
list_models_5 = omc.sendExpression('getClassNames(KundurSMIB,recursive=true)')
list_models_6 = omc.sendExpression('getClassNames(N44,recursive=true)')
list_models_7 = omc.sendExpression('getClassNames(PSAT_Systems,recursive=true)')
list_models_8 = omc.sendExpression('getClassNames(SevenBus,recursive=true)')
list_models_9 = omc.sendExpression('getClassNames(TwoAreas,recursive=true)')

list_models = list_models + list_models_1 + list_models_2 + list_models_3 + list_models_4 + list_models_5 + list_models_6 + list_models_7 + list_models_8 + list_models_9

newCopyrightFile = open('copyrightStatement')
newCopyright = newCopyrightFile.read()

# Loop on all models:
for model in list_models:
    # Get the current annotation
    anno = omc.sendExpression("getDocumentationAnnotation(%s)" % (model))
    info = anno[0].replace('"', '\\"')

    cmdString = 'setDocumentationAnnotation(%s,info="%s",revisions="%s")' % (model, info, newCopyright)
    try:
        omc.sendExpression(cmdString)
        omc.sendExpression("save(%s)" % model)
        print 'Model %s updated' % model
    except:
        print cmdString
        print model
        print info
        raise