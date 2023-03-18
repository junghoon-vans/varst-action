============
varst-action
============

GitHub Actions to replace substitutions in rst file using varST_.

Example workflow
================

Refer example workflow if you want to replace substitutions in ``README.rst`` and push it to repository.

.. parsed-literal::

   steps:
     - uses: actions/checkout@v3
     - name: Replace substitution
     - uses: junghoon-vans/varst-action@\ |release|
       with:
         substitutions: 'name=value'
     - uses: stefanzweifel/git-auto-commit-action@v4

Full example is |Sample Workflow|_.

Inputs
======

input-file
~~~~~~~~~~

**Optional**
The file path to read contents.

Default: ``./README.rst``

output-file
~~~~~~~~~~~

**Optional**
The file path to write contents.

Default: ``input-file``

substitutions
~~~~~~~~~~~~~

**Required**
A key-value of substitutions.

If multiple values need to be defined, use the literal style, indicated by a pipe (``|``)

.. code:: yml

   substitutions: |
     'name1=value1'
     'name2=value2'
     ...

version
~~~~~~~

**Optional**
The version of varST to use.

If not specified, the latest version will be used.

Contributing
============

Contribution Guideline
~~~~~~~~~~~~~~~~~~~~~~

Please read the |contributing guidelines|_ to learn how to contribute to this project.

Reporting Issues
~~~~~~~~~~~~~~~~

If you have any questions, suggestions, or bug reports, please feel free to report them to the issue.

Code of Conduct
~~~~~~~~~~~~~~~

This project is governed by the |code of conduct|_.

License
=======

`MIT
License <https://github.com/junghoon-vans/rst-substitution-action/blob/main/LICENSE>`__


.. _varST: https://github.com/junghoon-vans/varst
.. |release| replace:: v2.0.0

.. |Sample Workflow| replace:: here
.. _Sample Workflow: https://github.com/junghoon-vans/varst-action/blob/main/.github/workflows/bump-version.yml

.. |contributing guidelines| replace:: contributing guidelines
.. _contributing guidelines: https://github.com/junghoon-vans/varst-action/blob/main//CONTRIBUTING.md
.. |Code Of Conduct| replace:: Code of Conduct
.. _Code Of Conduct: ./CODE_OF_CONDUCT.md
