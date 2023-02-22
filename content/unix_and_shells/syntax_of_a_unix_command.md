+++
title = "Command Syntax"
date = 2023-02-14
weight = 3
pre = "<b>1.3. </b>"
+++

**Command line utilities** (or just commands) are a small programs designed for use in a command-line **shell**. When executed, they read input data from the **stdin** (standard in) **data stream** and returns an output the **stdout** (standard output) **data stream** (more on data streams in a moment). This predictable behaviour allows for the output of one command to be **piped** to the input of another.


As a rule-of-thumb, **command-line utilities** on **Unix-like** operating systems follow the syntax:

{{% notice highlight %}}
**verb adverb(s) object(s)**
{{% /notice %}}

* verb: an action or 'doing word'.
* adverb: a word that modifies the action described by a verb.
* object(s): target(s) being acted on.

Or, equivalently:

{{% notice highlight %}}
**[COMMAND] [OPTION(s)] [FILES(s)]**
{{% /notice %}}

For instance, consider the `ls` command,

	ls -A ~/

where `ls` (list files) is the verb, `-A` (list everything but `.` and `..`) is the adverb and `~/` (the user home directory) is the object. 


