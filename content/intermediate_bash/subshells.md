+++
title = "Subshells"
date = 2023-02-14
weight = 5
pre = "<b>2.5. </b>"
+++

In Example 3, the command `$(cd $(dirname ${BASH_SOURCE[0]});pwd)` carries out the following steps.

First, `$( [COMMANDS] )` spawns a new BASH **subshell** that contains only the default enviornment variables.

Next, this fresh subshell executes:

    cd [PATH TO SCRIPT FILE]

Where `[PATH TO SCRIPT FILE]` is the location of the script. Note that environment variable substitution occurs *before* the command is passed to the subshell.

Finally,

    pwd

returns the absolute path to the folder that contains the script to the originating (parent) shell.

