.. highlight:: dylan

*************
Serialization
*************

The Serialization library.

.. note:: This documentation is largely an automatically generated skeleton, as yet to be
          filled in.

.. current-library:: serialization

.. toctree::
   :maxdepth: 2
   :caption: Contents:
   :hidden:


The serialization module
========================

.. current-module:: serialization

The ``serialization`` module defines the protocols that support serialization of Dylan
objects to various formats.  For specific implementation modules see:

* `The json-serialization Module`_
* `The sexpr-serialization Module`_

.. class:: <property-list>

   :superclasses: :class:`<object>`

   :keyword required list: An instance of :class:`<collection>`.

.. class:: <serializer>

   :superclasses: :class:`<object>`

   :keyword required stream: An instance of :class:`<stream>`.

.. generic-function:: stream

   :signature: stream (object) => (value)

   :parameter object: An instance of :class:`<serializer>`.
   :value value: An instance of :class:`<stream>`.

.. generic-function:: write-array-field-start

   :signature: write-array-field-start (serializer field-name) => (#rest results)

   :parameter serializer: An instance of :class:`<serializer>`.
   :parameter field-name: An instance of :const:`<field-name>`.
   :value #rest results: An instance of :class:`<object>`.

.. generic-function:: write-end-array

   :signature: write-end-array (serializer) => (#rest results)

   :parameter serializer: An instance of :class:`<serializer>`.
   :value #rest results: An instance of :class:`<object>`.

.. generic-function:: write-end-object

   :signature: write-end-object (serializer) => (#rest results)

   :parameter serializer: An instance of :class:`<serializer>`.
   :value #rest results: An instance of :class:`<object>`.

.. generic-function:: write-field

   :signature: write-field (serializer field-name object) => (#rest results)

   :parameter serializer: An instance of :class:`<serializer>`.
   :parameter field-name: An instance of :const:`<field-name>`.
   :parameter object: An instance of :class:`<object>`.
   :value #rest results: An instance of :class:`<object>`.

.. method:: write-field
   :specializer: <serializer>, <field-name>, <object>

.. generic-function:: write-field-name

   :signature: write-field-name (serializer field-name) => (#rest results)

   :parameter serializer: An instance of :class:`<serializer>`.
   :parameter field-name: An instance of :const:`<field-name>`.
   :value #rest results: An instance of :class:`<object>`.

.. generic-function:: write-object

   :signature: write-object (serializer object) => (#rest results)

   :parameter serializer: An instance of :class:`<serializer>`.
   :parameter object: An instance of :class:`<object>`.
   :value #rest results: An instance of :class:`<object>`.

.. method:: write-object
   :specializer: <serializer>, <collection>

.. method:: write-object
   :specializer: <serializer>, <property-list>

.. method:: write-object
   :specializer: <serializer>, <table>

.. generic-function:: write-object-field-start

   :signature: write-object-field-start (serializer field-name) => (#rest results)

   :parameter serializer: An instance of :class:`<serializer>`.
   :parameter field-name: An instance of :const:`<field-name>`.
   :value #rest results: An instance of :class:`<object>`.

.. function:: write-object-to-string

   :signature: write-object-to-string (serializer-class object) => (#rest results)

   :parameter serializer-class: An instance of ``subclass(<serializer>)``.
   :parameter object: An instance of :class:`<object>`.
   :value #rest results: An instance of :class:`<object>`.

.. generic-function:: write-separator-array

   :signature: write-separator-array (serializer) => (#rest results)

   :parameter serializer: An instance of :class:`<serializer>`.
   :value #rest results: An instance of :class:`<object>`.

.. generic-function:: write-separator-field-name

   :signature: write-separator-field-name (serializer) => (#rest results)

   :parameter serializer: An instance of :class:`<serializer>`.
   :value #rest results: An instance of :class:`<object>`.

.. generic-function:: write-separator-object

   :signature: write-separator-object (serializer) => (#rest results)

   :parameter serializer: An instance of :class:`<serializer>`.
   :value #rest results: An instance of :class:`<object>`.

.. generic-function:: write-start-array

   :signature: write-start-array (serializer) => (#rest results)

   :parameter serializer: An instance of :class:`<serializer>`.
   :value #rest results: An instance of :class:`<object>`.

.. generic-function:: write-start-object

   :signature: write-start-object (serializer) => (#rest results)

   :parameter serializer: An instance of :class:`<serializer>`.
   :value #rest results: An instance of :class:`<object>`.


The json-serialization Module
=============================

Serialize objects in `JSON <https://json.org>`_ format.

.. current-module:: json-serialization


.. class:: <json-serializer>

   :superclasses: :class:`<serializer>`

   Serialize objects as JSON text.

.. method:: write-end-array
   :specializer: <json-serializer>

.. method:: write-end-object
   :specializer: <json-serializer>

.. method:: write-field-name
   :specializer: <json-serializer>, <field-name>

.. method:: write-object
   :specializer: <json-serializer>, <integer>

.. method:: write-object
   :specializer: <json-serializer>, <float>

.. method:: write-object
   :specializer: <json-serializer>, <symbol>

.. method:: write-object
   :specializer: <json-serializer>, <byte-string>

.. method:: write-object
   :specializer: <json-serializer>, singleton(#f)

.. method:: write-object
   :specializer: <json-serializer>, singleton(#t)

.. method:: write-separator-array
   :specializer: <json-serializer>

.. method:: write-separator-field-name
   :specializer: <json-serializer>

.. method:: write-separator-object
   :specializer: <json-serializer>

.. method:: write-start-array
   :specializer: <json-serializer>

.. method:: write-start-object
   :specializer: <json-serializer>


The sexpr-serialization Module
==============================

Serialize Dylan objects in `S-expression <https://en.wikipedia.org/wiki/S-expression>`_
format.

.. current-module:: sexpr-serialization

.. class:: <sexpr-serializer>

   :superclasses: :class:`<serializer>`

.. method:: write-end-array
   :specializer: <sexpr-serializer>

.. method:: write-end-object
   :specializer: <sexpr-serializer>

.. method:: write-field
   :specializer: <sexpr-serializer>, <field-name>, <object>

.. method:: write-field-name
   :specializer: <sexpr-serializer>, <field-name>

.. method:: write-object
   :specializer: <sexpr-serializer>, <integer>

.. method:: write-object
   :specializer: <sexpr-serializer>, <float>

.. method:: write-object
   :specializer: <sexpr-serializer>, <symbol>

.. method:: write-object
   :specializer: <sexpr-serializer>, <string>

.. method:: write-object
   :specializer: <sexpr-serializer>, singleton(#f)

.. method:: write-object
   :specializer: <sexpr-serializer>, singleton(#t)

.. method:: write-separator-array
   :specializer: <sexpr-serializer>

.. method:: write-separator-field-name
   :specializer: <sexpr-serializer>

.. method:: write-separator-object
   :specializer: <sexpr-serializer>

.. method:: write-start-array
   :specializer: <sexpr-serializer>

.. method:: write-start-object
   :specializer: <sexpr-serializer>
