+++
title = "Unix-like Operating Systems"
date = 2023-02-14
weight = 1
pre = "<b>1.1 </b>"
+++

A Unix like operating system is an operating system that behaves more-or-less like the Unix operating system. The first version of Unix was developed between 1969-71 at Bell Labs. It was one of the first operating systems to support multitasking and the first portable operating system written in C instead of processor dependant machine language.

Characteristics of a Unix-like operating system:

- **Everything is a file:** Almost every system device (e.g. storage, the keyboard and mouse) and resource (e.g. GPU or CPU) is abstracted to a **data stream** that can be read and written to like a regular file.

- **Core Utilities:** A set of core **command-line utilities:** that behave similarly to the core Unix utilities (`ls` `grep`, `ssh`).

- **Full or partial adherence to Unix specifications and the POSIX standard:**  A common set of commands and behaviours. **POSIX** is a collection of standards specified by the IEEE Computer Society. They maintain compatibility between operating systems and (broadly) versions of the same operating system by defining a common user-level application programming interface (API), command line shells and utilities.

The relevance of Unix-like operating systems is arguably due to the last of these three points and the advent of open-source and free-software projects. These include the Linux operating system and the GNU (GNU is Not Unix) toolchain, which provides a collection of compilers, libraries, debuggers and core utilities modelled on Unix. 

A few modern Unix-like operating systems are:

* Linux
* Android (which is based on Linux)
* MacOS (versions 10.5 and up are UNIX compliant)
* The Playstation 4 and 5 system software 'Orbis OS' (based on FreeBSD)

The portability, transparency and longevity of Unix-like operating systems make them a popular choice for the development of software tools for scientific computing. Linux is the de-facto standard in supercomputing.

