.. _contributing:

Contributing
============

We welcome all sorts of contribution to the project!

Get Started
-----------

However you decide to contribute to our project, please follow the following instructions:

- Create a `GitHub Account <www.github.com>`_.
- Browse our `Issues`_ base.
- Fork our repository!
- Create a pull request to our repository to submit your changes.

.. note::
   Your contribution can only be considered when you have signed our `Contributor License Agreement <https://www.clahub.com/agreements/SmarTS-Lab/OpenIPSL>`_.

Improve our Documentation
-------------------------

The documentation of the OpenIPSL is hosted on `Read the Docs <https://readthedocs.org/>`_ and is developed using the **reStructuredText** markup language.

The sources for compiling the documentations are placed in the ``./docs/`` folder of the repository.

The main goal of the documentation is to provide information on the development conventions adopted for this project, and provide a guide to the contributors of the project.


Useful Links
^^^^^^^^^^^^

Here is a collection of resources to learn about the reStructuredText markup language:

- `OpenIPSL Documentation <http://openipsl.readthedocs.io/en/latest/?badge=latest>`_
- `Get Started with Read the Docs <https://docs.readthedocs.io/en/latest/getting_started.html>`_
- `Some infos about reStructuredText <http://build-me-the-docs-please.readthedocs.io/en/latest/Using_Sphinx/OnReStructuredText.html>`_
- `Some more infos about reStructuredText <http://www.sphinx-doc.org/en/stable/rest.html#>`_

Improve the Library
-------------------

The library has been in development for a couple years now, and comprises many models for power system simulation.
We are, however, always interested in adding new models to the library, or improve the existing models.

Please always document your contribution in an issue in our `Issue`_  Tracker, feel free to create a new issue if none of the existing one fit your contribution.
This will allow the team managing the repository to review the suggested changes, and discuss the motivation behind them.

.. note::
   Structural changes to the library should be discussed with the team prior to any submission

When submitting new models to the library, please also include the following in the associated issue:

- A short report describing your component model, as well as the validation test.
- The source files that you used to validate your model against a reference tool.
- If the model is entirely new, and there is NO reference model to check against, some measurements could be useful...
- The data files to plot the comparison figures and compute the quantitative validation metrics.

.. note::
   We prepared a :download:`submission template <./submission-template.zip>` to help you prepare your submission.

Useful Links
^^^^^^^^^^^^

- `Issues`_ Tracker
- `MapleSoft Modelica Syntax Checker <http://www.maplesoft.com/products/maplesim/modelicachecker/>`_


.. _Issues : https://github.com/SmarTS-Lab/OpenIPSL/issues



