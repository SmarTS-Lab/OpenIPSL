[![Build Status](https://travis-ci.org/SmarTS-Lab/OpenIPSL.svg?branch=master)](https://travis-ci.org/SmarTS-Lab/OpenIPSL)
[![Documentation Status](https://readthedocs.org/projects/openipsl/badge/?version=latest)](http://openipsl.readthedocs.io/en/latest/?badge=latest)

# **OpenIPSL**: Open-Instance Power System Library:
The OpenIPSL or Open-Instance Power System Library is a fork of of the [iTesla Power System Library](https://github.com/itesla/ipsl), currently developed and maintained by the [SmarTS Lab](https://www.kth.se/en/ees/omskolan/organisation/avdelningar/epe/research/smart-transmission-systems-laboratory-smarts-lab-1.627203) research group, collaborators and friends (contributions are welcome!).

The iPSL is a [Modelica](https://www.modelica.org) library developed during the [iTesla project](http://www.itesla-project.eu/).
The members of this project (OpenIPSL) at SmarTS Lab where key developers of the iPSL until March 31, 2016, when the iTesla project was completed.
As iPSL is part of the [iTesla Tool](https://github.com/itesla/ipst), and thus, it is subject to the needs of the consortium that develops the iTesla Tool. We thus decided to create the OpenIPSL fork in order to develop the library in the direction that is most suitable for researchers and teachers/professors.

As such, the purpose of OpenIPSL are to be used as a research library (therefore frequent release times may be available), with maximum compatibility with OpenModelica (to provide a free/libre and cost-free alternative for power system dynamic simulation), to provide as many as possible typical "test networks" for use in research and teaching, and to be developed in such way that the library can efficiently be used for power system simulation within Modelica-based workflows (i.e. helping to give reference power system models for development and testing of Modelica back-end compilers) when faced with power system simulation challenges.

## Notice to Users:
This project encompasses the development of a Modelica library for power system simulation.
As such, there are no solver tools provided in this repository (no Power Flow Solvers, no Time-Domain solvers, etc.).
You can find more information in our [**documentation**](http://openipsl.readthedocs.io/en/latest/user-guide/get-started.html).

The OpenIPSL contains the models developed by SmarTS Lab during the iTesla project, and necesssary models that were implemented by RTE and AIA, that we can maintain.
Note that several models have been removed from what it is available in iPSL (see [here](https://github.com/SmarTS-Lab/OpenIPSL/pull/10)).
However, we have removed all models that are dependent on a specific software tool from the power systems domain that we don't have access for Software-to-Software validation, and those that require us access to closed standards that we don't have money to buy in order to maintain them (i.e. IEC Wind Turbine models).

## Documentation:
Please follow this link to our [**documentation**](http://openipsl.readthedocs.io/).

Tutorials on OpenIPSL have been given at many conferences, and are available under [Release](https://github.com/SmarTS-Lab/OpenIPSL/releases). We recommend you start from there.

Our documentation assumes that you have working knowledge of the Modelica language, are familiar with a Modelica-compliant modeling and simulation environment, that you have proeficient knowledge on power system steady state analysis (i.e. the so called "power flow"), and knowledge on power system dynamic modeling (i.e. the called "transient" and "small-signal" stability).

As such, the documentation is limited, and aims to provide very consice information for people who fulfill the requirements above. If you do not fulfill these requirements, we recommend that you first get acquainted with both Modelica and Power Systems.

Additional details about many of the models in OpenIPSL are available in disparate sources. Some of these are a reflection of the results from the efforts of many students that have worked with Prof. Luigi Vanfretti. See our [Publication List](http://openipsl.readthedocs.io/en/latest/publications.html) for more details on the models available. 
In addition, you can also browse a few of the MSc thesis of the students that carried out their MSc research under Prof. Vanfretti's group in the following links: Joan Russiñol (2013, [download](http://www.eps.ee.kth.se/personal/vanfretti/documents/mscthesis/2013_Joan_MSc_Thesis.pdf)), Le Qi (2014, [dowload](http://www.eps.ee.kth.se/personal/vanfretti/documents/mscthesis/2014_LeQi_MScThesis.pdf)), M.Ahsan Adib Murad (2015, [download](http://www.eps.ee.kth.se/personal/vanfretti/documents/mscthesis/2015_Ahsan_MScThesis.pdf)), and Mengjia Zhang (2015,[download](http://www.eps.ee.kth.se/personal/vanfretti/documents/mscthesis/2015_MengjiaZhang_MScThesis.pdf)).

We would love to develop a detailed documentation, however, the development of OpenIPSL is being carried out in "best effort" basis by the project contributors. If you want a better documentation, and are willing to pay for our time to develop it, get in touch with use through the "Issues" feature in Github.

## Contributing:
Contributions to the library are welcome and can be submitted in the form of pull requests to this repository.
Contributions can be of different nature, such as addition of a new component model, re-organisation of the structure of the library, change in the development practices, etc.

Please consult the [contribution guidelines](http://openipsl.readthedocs.io/en/latest/community/contributing.html).

More information about our contributors can be found over [here](http://openipsl.readthedocs.io/en/latest/community/community-home.html). Don't hesitate to contact us.

## Citing OpenIPSL in Publications:
If you use OpenIPSL in your work or research, all we ask you in exchange is that you **cite the reference publications**, according to your use.
Please consult our [Publication List](http://openipsl.readthedocs.io/en/latest/publications.html), for browsing the reference publications.

Preferably, please cite the following paper:
L. Vanfretti, T. Rabuzin, M. Baudette, and M. Murad, iTesla Power Systems Library (iPSL): A Modelica library for phasor time-domain simulations, SoftwareX, Available online 18 May 2016, ISSN 2352-7110, [DOI: 10.1016/j.softx.2016.05.001](http://dx.doi.org/10.1016/j.softx.2016.05.001).
Link to Publisher's Website: [SoftwareX](http://www.sciencedirect.com/science/article/pii/S2352711016300097)

You are also welcome to submit your contributions as stated above.

## License Information:

The OpenIPSL is released under the same license as the original iPSL project.
All changes applied in this fork have the following copyright statement.

### OpenIPSL:

Copyright April 2016 - SmarTS Lab
- [SmarTS Lab](http://openipsl.readthedocs.io/en/latest/community/community-home.html), research group at KTH: https://www.kth.se/en

The authors can be contacted by email: [luigiv@kth.se](href="mailto:luigiv@kth.se?subject=From_OpenIPSL_in_Github").
This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0.

### iPSL:

Copyright 2015-March 31 2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)
- RTE: http://www.rte-france.com
- [SmarTS Lab](http://openipsl.readthedocs.io/en/latest/community/community-home.html), research group at KTH: https://www.kth.se/en
- AIA: http://www.aia.es/en/energy
- DTU: http://www.dtu.dk/english

The authors can be contacted by email: info@itesla-ipsl.org

This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0.
