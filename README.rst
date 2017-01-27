======
tomcat
======

Formula to set up and configure tomcat webserver

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``openjdk``
----------

Installs Open JDK and updates alternatives to point make this default java.
Additionally the JAVA_HOME is set via script in profile.d, the script will make
sure that currently configured on path java is the one pointed by java home.
package.
