+++
title = "A New Unix Command"
date = 2023-02-14
weight = 1 
pre = "<b>2.1. </b>"
+++

To guide our journey through some of the more exciting features of BASH we'll consider what it'd take to implement a new 'Unix command' using BASH alone. This command will attempt to address a familiar trap for newcomers to Unix.

The remove command, 

    rm [FILE]

deletes the target `[FILE]` permanently. Great if you meant it - not so great otherwise.

There are several ways to solve this issue: backing up often, using version control, or even defining an *alias* to `rm` (see section 3.2). However, none of these (very sensible) solutions will allow us to flex our scripting muscles...

Instead, let's create a command that behaves more like the `delete` action in a GUI shell where "deleted" files are moved to a "recycle bin" directory from which they can be restored or deleted permanently - we'll call this command `del`.

Once implemented, `del` will:

1. Sends target FILES(s) to a hidden directory, `.recycle_bin`: 


```
del [FILE(s)]
```

2. List the N most recently 'recycled' files when passed the `-l` option with a number `N`: 

```
del -l [N]
```

3. Restore the `N` most recent 'recycles' with the `-u`- option: 

```
del -u [N]
```
