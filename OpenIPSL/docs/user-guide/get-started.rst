**********
User Guide
**********

.. _Get Started:

Get Started with OpenIPSL
=========================

The OpenIPSL was developed to be a familiar alternative to traditional power system analysis tools.
There are, however, some particularities to the nature of the library, presented in this Section.

Package Content
---------------

The OpenIPSL has been developed as a `Modelica`_ library for power system simulations.
The repository contains the following:

* The OpenIPSL package:
   A Modelica library for power system component models.
* The Application Examples:
   A set of power system network models implemented in separate Modelica packages.

.. note::
   The repository does **not** provide any external software packages.
   The simulation of the models requires separate Modelica-compliant software packages.


Power Flow Solvers / Software
-----------------------------

There is no power flow solver associated to the library.
When building a use case, initialization of all variables must be performed with a power flow software.
The users are free to choose their power flow software of choice.

Please note that during the development of the library, the power flow software used corresponds to that of the reference model, for example, for models coming from `PSAT`_, we created the same power system model in `PSAT`_ and in Modelica using our library.
The power flow solution from PSAT was then reported into the corresponding "power flow solution parameters" corresponding to each model.

Within the iTesla Toolbox (i.e. the whole platform), there are different power flow tools implemented and also an "Automatic Translator" that takes a file with the parameters of a model (as defined by a domain specific tool) and populates the power flow parameters of the models.
Therefore, there was no need to develop a power flow solver.

Running Time-Domain Simulations
-------------------------------

There is no Modelica-compliant tool provided to run the time domain simulations.
Users of the OpenIPSL are free to choose their tool of choice.

Please note that the development of OpenIPSL has been carried out using `OpenModelica`_  and `Dymola`_.
The library is, also, systematically checked with `OpenModelica`_ in the repository (see :ref:`Continuous Integration <CI>`).
It might be possible to face issues when using other `Modelica tools`_ that we have not fully tested.

.. Links
.. _Modelica: https://www.modelica.org
.. _PSAT: http://faraday1.ucd.ie/psat.html
.. _OpenModelica: https://www.openmodelica.org/
.. _Dymola: http://www.3ds.com/products-services/catia/products/dymola
.. _Modelica tools: https://modelica.org/tools