+++
title = "Data Streams"
date = 2023-02-14
weight = 4
chapter = true
pre = "<b>4. </b>"
+++
## 4. Data Streams

A data streams transfer data (usually text) from a source (file, device or program) to an outflow in another.

When a BASH session starts, it creates three default data streams which are each assigned an integer file handle (remember, everything is a file).

- **stdin** (file handle 0):    The standard input data stream, most often takes input from the keyboard.

- **stdout** (file handle 1):      The standard output data stream. Passes data to the display by default.

- **stderr** (file handle 2):    The standard error data stream. Passes data to the display by default.

Data streams created by BASH.

The `read` command takes input from stdin.

    read
    This is to stdin

 Command-line utilities output to stdout:

    ls -A .

    total 3
    drwxr-xr-x. 1 edric edric    0 Nov  5 23:05 Videos
    drwxr-xr-x. 1 edric edric 3058 Nov 18 18:38 Downloads
    drwxr-xr-x. 1 edric edric   24 Nov 19 21:32 software

Unless they encounter an error:

    ls -A nonexistant

The above returns the error:

    ls: cannot access 'nonexistent': No such file or directory

Which is printed to stderr.

The pipe command `|`, passes stdout to another command and `|&` pipes stderr and stdout to stdin (this can help with debugging).

To redirect stdout:


To redirect and append:

    df -h >> diskusage.txt

More generally, `&[FILE HANDLE FROM]>[FILE HANDLE TO]` redirects the data stream with [FILE HANDLE FROM] to [FILE HANDLE TO].

For instance, to redirect stderr to stdout:

    ls -A nonexistant 2>&1

The `&` before the `1` is important, without it is ambiguous as to wether we are referencing a file named "1".

Data can be sent to a command by redirecting stdin (though this is not very common):

    command < input.txt

To discard the output of a datastream we can redirect it to`\dev\null`, which discards all data written to it.

    command > /dev/null

It's possible to open addition file descriptors, but stdin, stdout and stderr are usually sufficiant.

