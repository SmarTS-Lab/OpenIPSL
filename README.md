[![Build Status](https://travis-ci.org/SmarTS-Lab/OpenIPSL.svg?branch=master)](https://travis-ci.org/SmarTS-Lab/OpenIPSL)
# **OpenIPSL**: Open-Instance Power System Library:
The OpenIPSL or Open-Instance Power System Library is a fork of of the [iTesla Power System Library](https://github.com/itesla/ipsl), currently developed and maintained by the [SmarTS Lab](https://www.kth.se/en/ees/omskolan/organisation/avdelningar/epe/research/smart-transmission-systems-laboratory-smarts-lab-1.627203) research group, collaborators and friends (contributions are welcome!).

The iPSL is a [Modelica](https://www.modelica.org) library developed during the [iTesla project](http://www.itesla-project.eu/). 
The members of this project (OpenIPSL) at SmarTS Lab where key developers of the iPSL until March 31, 2016, when the iTesla project was completed.
As iPSL is part of the [iTesla Tool](https://github.com/itesla/ipst), and thus, it is subject to the needs of the consortium that develops the iTesla Tool. We thus decided to create the OpenIPSL fork in order to develop the library in the direction that is most suitable for researchers and teachers/professors.

As such, the purpose of OpenIPSL are to be used as a research library (therefore frequent release times may be available), with maximum compatibility with OpenModelica (to provide a free/libre and cost-free alternative for power system dynamic simulation), to provide as many as possible typical "test networks" for use in research and teaching, and to be developed in such way that the library can efficiently be used for power system simulation within Modelica-based workflows (i.e. helping to give reference power system models for development and testing of Modelica back-end compilers) when faced with power system simulation challenges. 

## Notice to Users:
This project encompasses the development of a Modelica library for power system simulation.
As such, there are no solver tools provided in this repository (no Power Flow Solvers, no Time-Domain solvers, etc.).
You can find more information on the [Wiki - Page] (update link).

The OpenIPSL contains the models developed by SmarTS Lab during the iTesla project, and necesssary models that were implemented by RTE and AIA, that we can maintain. 
Note that several models have been removed from what it is available in iPSL (see [here](https://github.com/SmarTS-Lab/OpenIPSL/pull/10)). 
However, we have removed all models that are dependent on a specific software tool from the power systems domain that we don't have access for Software-to-Software validation, and those that require us access to closed standards that we don't have money to buy in order to maintain them (i.e. IEC Wind Turbine models).

## Documentation:
Currently, we are developing an 'application guide' with examples how to use the library and documentation on many of the test networks developed by different people.
Documentation on the use of thi library will most likely be in the form of tutorials, as the use of Modelica tools is not the main interest of this fork.

You can follow the following issues to know about our progress: [Application Guide](update link) and [Test Networks](update link).

## Contributing:
Contributions to the library are welcome and can be submitted in the form of pull requests to this repository.
Contributions can be of different nature, such as addition of a new component model, re-organisation of the structure of the library, change in the development practices, etc. Please post your suggestion in the "Issues" tab

Please consult the [contribution guidelines](update link).

## Citing OpenIPSL in Publications:
If you use OpenIPSL in your work or research, all we ask you in exchange is that you **cite the reference publications**, according to your use.
Please consult our [Publication List](https://github.com/SmarTS-Lab/OpenIPSL/wiki/Publications/), for browsing the reference publications.

Preferably, please cite the following paper:
L. Vanfretti, T. Rabuzin, M. Baudette, and M. Murad, iTesla Power Systems Library (iPSL): A Modelica library for phasor time-domain simulations, SoftwareX, Available online 18 May 2016, ISSN 2352-7110, [DOI: 10.1016/j.softx.2016.05.001.](http://dx.doi.org/10.1016/j.softx.2016.05.001.).
Link to Publisher's Website: [SoftwareX](http://www.sciencedirect.com/science/article/pii/S2352711016300097)

You are also welcome to submit your contributions as stated above.

## Copyright assignment:
Whe submitting a "Push" of a new contribution, it will be assumed that you assign copyright of your contributions to the OpenIPSL

"I hereby assign copyright of my contributions to the iPSL, to be licensed under the same terms as the rest of the iPSL."

## License Information:

The OpenIPSL is released under the same license as the original iPSL project. 
All changes applied in this fork have the following copyright statement.

### OpenIPSL:

Copyright April 2016 - SmarTS Lab
- [SmarTS Lab](https://github.com/itesla/ipsl/wiki/Our-contributors#smarts-labs-people), research group at KTH: https://www.kth.se/en

The authors can be contacted by email: [luigiv@kth.se](href="mailto:luigiv@kth.se?subject=From_OpenIPSL_in_Github").
This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0.

### iPSL:

Copyright 2015-March 31 2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)
- RTE: http://www.rte-france.com
- [SmarTS Lab](https://github.com/itesla/ipsl/wiki/Our-contributors#smarts-labs-people), research group at KTH: https://www.kth.se/en
- AIA: http://www.aia.es/en/energy
- DTU: http://www.dtu.dk/english

The authors can be contacted by email: info@itesla-ipsl.org

This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0.
