<!-- omit in toc -->
# Table of Contents

<br />

# Fundamental Concepts
## Process
* systems execute a process and obtain a PID
  * systems only recognize a binary file => execute a binary file
    * a binary file = a program
* multiple people enter bash 
  * use the program, `/bin/bash`
  * when people call the program, different gid will be assigned to them
* PID is a subprogram
  * bash is a parent program => see PPID
* when finding a process is killed, but it is still regenerated. Possible reasons are:
  * cronjob
  * its parent program is still alive
## Process vs program
  * process: a running program with a PID. The process is running in memory
  * program: binary program. An actual program to be stored 

<br />

## fork-and-exec
* calling between processes
  * parent process forks a parent process 
  * the forked parent process executes the actual subprocess

<br />


## daemon 
* services run in the background
  * the service can not be interactive with users, or it can not be run in the background
    * e.g. vim
  * can not be killed by `ctrl + c`
* if the suffix is with `d`, it implies using daemon
  * crond
  * atd
* only executes the tasks from the own bash. can not run the tasks from other bash.
  * even if `root`, it can not distribute tasks to other bash

## multi-people environment
* everyone can change their configurations. related to 
  *  ~/.bashrc
  *  PID
* use `[Alt]+[F1].....[F7]` to switch the terminals of different people
  * the number of connections to the terminals are limited by `/etc/security/limits.conf`

## tasks are broken and stop. How to deal with them?
* switch to other terminals
* `ps -aux` and find the broken process and `kill` it


<br />

## job control
* running multiple tasks under the single terminal
* stdout and stderr should be sent to other files by data pipelines or foreground will be affected

<br />

# Commands 

## make current tasks run in the daemon and users can do other tasks at the same time
* use `&`
```bash
    # make copy running in the daemon
    cp file1 file2 &

    # output
    ## the first column is the number of job
    ## the second column is PID

```