import sys
from CITests import CITests

# Libs in Application Examples
appExamples = {
"KundurSMIB":"/ApplicationExamples/KundurSMIB/package.mo",
"TwoAreas":"/ApplicationExamples/TwoAreas/package.mo",
"SevenBus":"/ApplicationExamples/SevenBus/package.mo",
"IEEE9":"/ApplicationExamples/IEEE9/package.mo",
"IEEE14":"/ApplicationExamples/IEEE14/package.mo",
"AKD":"/ApplicationExamples/AKD/package.mo",
"N44":"/ApplicationExamples/N44/package.mo",
"OpenCPSD5d3B":"/ApplicationExamples/OpenCPSD5d3B/package.mo",
"RaPIdExperiments":"/ApplicationExamples/RaPIdExperiments/package.mo",
"ThreePhase":"/ApplicationExamples/ThreePhase/package.mo"
}

# Instance of CITests
ci = CITests("/OpenIPSL")

# Run Check on OpenIPSL
passLib = ci.runSyntaxCheck("OpenIPSL","/OpenIPSL/package.mo")

if not passLib:
    # Error in OpenIPSL
    sys.exit(1)
else:
    # Run Check on App Examples
    passAppEx = 1
    for package in appExamples.keys():
        passAppEx = passAppEx * ci.runSyntaxCheck(package,appExamples[package])

    # The tests are failing if the number of failed check > 0
    if passAppEx:
        # Everything is fine
        sys.exit(0)
    else:
        # Exit with error
        sys.exit(1)
