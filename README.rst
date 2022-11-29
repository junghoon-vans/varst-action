=======================
rst-substitution-action
=======================

Github action to replace substitutions in rst file.


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

If multiple values need to be defined, use folded block scalar style.


.. code:: yml

   substitutions: >-
     'name1=value1'
     'name2=value2'
     ...

License
=======

`MIT
License <https://github.com/junghoon-vans/rst-substitution-action/blob/main/LICENSE>`__
