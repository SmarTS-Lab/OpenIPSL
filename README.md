<!---
[![Build Status](https://travis-ci.org/OpenIPSL/OpenIPSL.svg?branch=master)](https://travis-ci.org/OpenIPSL/OpenIPSL)
[![Documentation Status](https://readthedocs.org/projects/openipsl/badge/?version=latest)](http://openipsl.readthedocs.io/en/latest/?badge=latest)
-->
[![Build Status](https://github.com/openipsl/openipsl/actions/workflows/checkCI.yml/badge.svg?branch=master)]

# **OpenIPSL**: Open-Instance Power System Library:
The OpenIPSL or Open-Instance Power System Library is library of power system component models written in the [Modelica](http://modelica.org) language that can be used for power system dynamic analysis, such as phasor time-domain simulations.

OpenIPSL is currently developed and maintained by Prof. [Luigi Vanfretti's](https://github.com/lvanfretti) research group [ALSETLab](https://github.com/ALSETLab) at [Rensselaer Polytechnic Institute](http://rpi.edu), Troy, NY, collaborators and friends, such as [Dietmar Winkler](https://github.com/dietmarw) and [FOSSEE](https://om.fossee.in/fellowship2018) (contributions are welcome!).

## Scope
The purposes of OpenIPSL are to be used for research and education (therefore frequent release times may be available), with maximum compatibility with [OpenModelica](http://openmodelica.org/) (to provide a free/libre and cost-free alternative for power system dynamic simulation), to provide as many as possible typical "test networks" for use in research and teaching, and to be developed in such way that the library can efficiently be used for power system simulation within Modelica-based workflows (i.e., helping to give reference power system models for development and testing of Modelica back-end compilers) when faced with power system simulation challenges.

Please note that the library contains only models that can be used for the study. As such, there are no solver tools provided in this repository (no Power Flow Solvers, no Time-Domain solvers, etc.).
The user should use a Modelica-compliant tool for simulation of models in this lirbary.

## History
The iPSL is a [Modelica](https://www.modelica.org) library developed during the [iTesla project](http://www.itesla-project.eu/).
The members of this project (OpenIPSL) at SmarTS Lab (now [ALSETLab](https://github.com/ALSETLab)) where key developers of the iPSL until March 31, 2016, when the iTesla project was completed.
Prof. [Luigi Vanfretti](https://github.com/lvanfretti) lead the development of a large amount of the models of the library (particularly those that replicate results from PSAT and PSS/E).
iPSL is part of the [iTesla Tool](https://github.com/itesla/ipst), and thus, it is subject to the needs of the consortium that develops the iTesla Tool.
Therefore, the SmarTS Lab / ALSETLab team decided to create the OpenIPSL fork in order to develop the library in a direction that is more suitable for researchers and teachers/professors, and in a transparent, open source software approach.

## Documentation:
Documentation is provided within the library and can be accessed when loading OpenIPSL in any Modelica-compliant tool. Additional documentation can also be found [**here**](http://openipsl.readthedocs.io/).

Tutorials on OpenIPSL have been given at many conferences, and are available under [Release](https://github.com/SmarTS-Lab/OpenIPSL/releases).
We recommend you start from there.

Our documentation assumes that you have working knowledge of the Modelica language, are familiar with a Modelica-compliant modeling and simulation environment, that you have proeficient knowledge on power system steady state analysis (i.e., the so called "power flow"), and knowledge on power system dynamic modeling (i.e., the called "transient" and "small-signal" stability). As such, the documentation is limited, and aims to provide very consice information for people who fulfill the requirements above. If you do not fulfill these requirements, we recommend that you first get acquainted with both Modelica and Power Systems.


## Contributing:
Contributions to the library are welcome and can be submitted in the form of pull requests to this repository.

Please consult the [contribution guidelines](http://openipsl.readthedocs.io/en/latest/community/contributing.html).

More information about our contributors can be found over [here](http://openipsl.readthedocs.io/en/latest/community/community-home.html).

Don't hesitate to contact us.

## Citing OpenIPSL in Publications:
If you use OpenIPSL in your work or research, all we ask you in exchange is that you **cite the reference publications**, according to your use.
Please consult our [Publication List](http://openipsl.readthedocs.io/en/latest/publications.html), for browsing the reference publications.

Preferably, please cite the following paper:
  - Maxime Baudette, Marcelo Castro, Tin Rabuzin, Jan Lavenius, Tetiana Bogodorova, Luigi Vanfretti, OpenIPSL: Open-Instance Power System Library — Update 1.5 to “iTesla Power Systems Library (iPSL): A Modelica library for phasor time-domain simulations”, SoftwareX, Volume 7, January–June 2018, Pages 34-36, ISSN 2352-7110, https://doi.org/10.1016/j.softx.2018.01.002
    - Link to Publisher's Website: [SoftwareX](https://www.sciencedirect.com/science/article/pii/S2352711018300050)

You are also welcome to submit your contributions as stated above.

## Copyright and License Information:

The OpenIPSL is released under the same license as former iPSL project.
All changes applied in this fork have the following copyright statement.

### OpenIPSL:
Copyright July 2017 - current [Luigi Vanfretti](https://github.com/lvanfretti), [Rensselaer Polytechnic Institute](http://rpi.edu), [ALSETLab](https://github.com/ALSETLab), Troy, NY.

Copyright April 2016 - May 2017 [SmarTS Lab](http://openipsl.readthedocs.io/en/latest/community/community-home.html); Prof. [Luigi Vanfretti's](https://github.com/lvanfretti) research group formerly at KTH Royal Institute of Technology, Stockholm, Sweden, now [ALSETLab](https://github.com/ALSETLab) at Rensselaer Polytechnic Institute, Troy, NY, USA.

The authors can be contacted by email: [luigi.vanfretti@gmail.com](href="mailto:luigi.vanfretti@gmail.com?subject=From_OpenIPSL_in_Github").
This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0.

#### iPSL:
Copyright 2015-March 31 2016 [RTE](http://www.rte-france.com) (France), [SmarTS Lab](http://openipsl.readthedocs.io/en/latest/community/community-home.html) (Prof. [Luigi Vanfretti's](https://github.com/lvanfretti) research group formerly at KTH Royal Institute of Technology, Stockholm, Sweden), [AIA](http://www.aia.es/en/energy) (Spain) and [DTU](http://www.dtu.dk/english) (Denmark).
The authors can be contacted by email: info@itesla-ipsl.org
This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0.

## Acknowledgements:


This work was supported in primarily by the New York State Energy Research and Development Authority (NYSERDA) through the Electric Power Transmission and Distribution (EPTD) PON 3770 High Performing Grid Program together with the New York Power Authority (NYPA). This work was also supported in part by the ERC Program of the National Science Foundation and DOE under NSF Award Number EEC-1041877 and the CURENT Industry Partnership Program.
