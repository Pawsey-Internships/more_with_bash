+++
title = "Process Management"
date = 2023-02-14
weight = 19
pre = "<b>4.1. </b>"
+++

Unix-like operating systems are multitasking - something that we experience if using the desktop environment of macOS or a Linux distribution.

Consider the following command,

	watch -n1 'cat /proc/meminfo | grep MemFree'

which shows the current free RAM, updated every 1 second.

A program that we can see in the terminal is running in the `foreground`; to abort a program running in the foreground, we can use `Ctrl+c`.

To suspend the task, we can instead use `ctrl+Z`, at which point we see output that gives the process number (JOB SPEC) and the status of the process.

Let's run another version of the command that instead looks at the amount of cached memory:

	watch -n1 'cat /proc/meminfo | grep -w Cached'

which we will also suspend.

To start one of these processes back up, we use the `foreground` command,

	fg 1

or the background command

	bg 1

Which will start the process running in the background. 'bg [job spec]' is equivalent to starting a command with `&`

	watch -t -n1 "date +'%H:%M:%S' | tee -a loged" &*/dev/null &

To see a list of foreground and background processes with their corresponding 'job spec':

	jobs

To end a non-responsive job, we can retrieve the process IDs,

	jobs -p

and issue the `kill` command. For example, given a PID of `1484`:

	kill -KILL 1484

