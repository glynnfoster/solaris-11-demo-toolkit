Blah Oracle Solaris 11 Demo Toolkit
==============================

May 2013

What is it?
-----------

Oracle Solaris 11 Demo Toolkit is a set of scripts that help to automate
demonstrating major Oracle Solaris 11 features. It is developed for everybody
who wants to learn more about Oracle Solaris 11, but doesn't have time to go
through the official documentation. 

How it can be used?
-------------------

The toolkit can be used by Oracle Sales Consultants to demonstrate Oracle
Solaris 11 in front of customers. It can also be used in conjunction with
Oracle Solaris Hands-on Labs where participants are not only watching Oracle
Solaris screen, but executing commands themselves. It is recommended that demo
session is preceded by a technical presentation describing Oracle Solaris
features. It is also possible to switch between slides and demo going from
topic to topic.

Requirements
------------

Oracle Solaris 11.1 (SPARC or x86)

Downloading
-----------

The latest version of the Oracle Solaris 11 Demo Toolkit is available at the
following source code repository:

It can be downloaded either as source repository containing only the demo
scripts, or as a VirtualBox virtual appliance which has preinstalled Oracle
Solaris 11 instance with all necessary scripts. 

Installation
------------

To install the toolkit, perform the following:

user@solaris:~$ make

You may need to ensure that the pkg:/developer/build/make IPS package is
installed first.

If you are using the Oracle VM VirtualBox image, start your Oracle VM
VirtualBox application, use File->Import Appliance and choose the .ova file
you have downloaded.

Usage
-----

1) Allow the demo to run X11 graphical programs

  user@solaris:~$ xhost +

2) Log in as root

  root@solaris:~$ su -

  Password:

  root@solaris:~#

3) Start the Oracle Solaris 11 Demo Toolkit

  root@solaris:~$ cd solaris-11-demo-toolkit

  root@solaris:~$ ./mainmenu

4) Choose topic (ZFS, Zones, Boot Environments, etc.) and demo inside the topic. After the demo is finished, it returns to the menu.

5) Most of the demos are independent and can be run in any order, but some demos (e.g. in Zones) should be performed in the order the appear in the menu. For example, zone cloning should go after zone installation. For such demos it will be mentioned at the start of the demo.

Editing and creating your own demos
-----------------------------------

This toolkit uses a Perl module called demotools.pm created by Christoph Schuba. The scripts also use Term::ANSIColor module to produce color output in terminal screens. A demo script consists of two parts: the story part and the commands part. 

You can edit the demo scripts yourself to adjust them to your particular situation or installation.

If you want to produce your own scripts, the Python script scripts/makedemo.py is provided to generate Perl demo scripts from a simple text file. The source text file has a pretty simple format:

If a line starts with "S ", then it translates into a story line with a defined color in Perl script.

If it starts with "C ", then it becomes a command line in scripts/demotools.pm notation.

If none of the above, the string is copied to the demo Perl script unchanged (that means it should be written in Perl).

License
-------

COMMON DEVELOPMENT AND DISTRIBUTION LICENSE VERSION 1.0 (CDDL-1.0)
http://opensource.org/licenses/cddl1.php

Contributors
------------

- Pavel Anni
- Jim Fiori
- Jim Helmstetter
- Christoph Schuba
- Glynn Foster
- Art Beckman
