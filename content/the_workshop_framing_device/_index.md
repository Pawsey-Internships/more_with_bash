+++
title = "The Workshop Framing Device"
date = 2023-02-14
weight = 6
chapter = true
pre = "<b>2. </b>"
+++
## 6. Defining the `del` command.

The remove command, 

    rm [FILE]

deletes the target `[FILE]` permanently. Great if you meant it - not so great otherwise.

In portion of the workshop, we'll develop a user-defined `del` command that:

1. Sends target FILES(s) to a hidden directory, `.recycle_bin`: `del [FILE(s)]`
2. When passed the -l option lists the N most recently 'recycled' files: `del -l [N]`
3. When passed the -u option undoes the N most recent 'recycles': `del -u [N]`

Where `-l` and `-u` are options and `N` is an integer value.

