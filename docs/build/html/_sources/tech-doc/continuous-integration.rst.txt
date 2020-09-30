.. _CI:

Continuous Integration
======================

The OpenIPSL repository is connected to `Travis CI`_ that provides **Continuous Integration** services to the repository.

In the current implementation, the CI server performs:

- Modelica syntax checking for all classes in OpenIPSL
- Modelica syntax checking for all *Application Examples*

An upcoming extension of the CI implementation will also include regression testing to ensure the validation status of all models.

.. Links:

.. _Travis CI: https://travis-ci.org/

.. Future :

   regression testing. To generate references, we use either PSAT or PSS/E,
   because we want to give users the confidence that our library will give the same quality of outputs as standard simulation tools from our field.
   If you are unfamiliar with regression testing, [here](http://www.modelon.com/blog/articles/regression-testing-as-an-enabler-for-excellence-in-model-development/)
   you can find an article that explains very nicely why this is important!
