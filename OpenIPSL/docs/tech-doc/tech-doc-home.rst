
***********************
Technical Documentation
***********************

.. toctree::
   :hidden:

   continuous-integration


Development Guidelines
======================

The team behind OpenIPSL strives to achieve a harmonized development of the library to facilitate its usability and integration into other services.

Naming Convention
-----------------

Here are some naming conventions that we try to obey:

- Names of the parameters and variables should correspond to those found in documentation.
- Subscript should be denoted in Modelica with underscore, e.g. T_r or K_1
  **Note!** Some names have first upper case letters and others lower case.
- Deviation signals such as delta omega, should be written as domega in Modelica.
- Parameters which are not to be entered by user and variables not to be seen by user should be **protected**
- Units should be written in parentheses in the description of the parameter or variable (see e.g. of the power flow)


Initialization Routines
-----------------------

The models in the library are initialized from a power flow solution.
All model for power system component should take in, as parameters, the power flow solution for the bus it is attached to.

The full initialization of the components' internal variables and states is achieved by a set of internal ``initial equations`` that are to be derived by the developer of the model.

In a effort to harmonized the presentation of the power flow parameters, a model should extend ``pfComponent`` that will provide all the necessary parameters.
The ``pfComponent`` also provide the support for the common ``sysBase`` component that provides a single instance of the system's common parameters.

Connectors
----------

...