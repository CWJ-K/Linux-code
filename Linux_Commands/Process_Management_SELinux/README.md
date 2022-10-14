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

## Stop the current task => throw tasks to the daemon 
* `ctrl + Z`
  * the first column of output is the job number
    * `+`: the latest job
    * `-`: the oldest job
* stop the current tasks to make them wait in the daemon
* use `jobs` to see the status of the current tasks

```bash
  jobs [-lrs]

```


## throw tasks from the daemon to the foreground
* will change the symbol `+` to the job processed by `fg`


```bash
  #  job number is the first column of jobs
  ## %: optional, without %, it takes the job with `+`

  fg %<job_number>

```

## run the job in the daemon

```bash
  bg %<number_job>

  # check the change
  jobs; bg; jobs

  ## the command of the job with + ends with & 
```

## remove the job in the daemon
* signal: 15 vs 9
  * 15 (normal process to kill a job): if use vim, .<file name>.swp is created. kill the `vim <file name>` will also remove .<file name>.swp
    * in fact, `vim` can not be ended by `kill`
  * 9 (abnormal process to kill a job): will not remove .<file name>.swp
* signal: 9
  * when you do not know how to stop a process

```bash
  kill -<signal> %<number_job>
  
  # signal
  ## 1: reload
  ## 2: same as ctrl + z
  ## 9: force to delete jobs
  ## 15: stop a job by normal processes

  # without %, default is PID

  # list all available signals
  kill -l

```

## Offline management
* Notes above all make jobs run in the daemon of bash, instead of a system
  * if the system becomes offline, jobs in the daemon will stop
* makes tasks run in the system
  * [`at`](/Linux_Commands/crontab/README.md)
  * `nohup` 

### nohup
* does not support the internal commands of bash
  * execute .sh files
* even if you leave the system, the jobs still run

```bash
  nohup <commands or arguments>

  # execute in the daemon
  nohup <commands or arguments> &

```

## Process Management
### Check the status
#### ps
* inactive. capture the process at a specific time

```bash
  # check your own bash
  ps -l
  # check all processes in the system
  ps aux

```
* Table of outputs: `ps -l`
  |Column Name|Meaning|Note|
  |:---:|:---:|:---:|
  |F|process flags. It implies the permission of processes|4: root; 1: subprogram only forks, no executes|
  |S|the status of processes|R: running; S: sleep; D: sleep but can not be wakened. e.g. waiting for I/O , T: stop, Z: zombie|
  |UID/PID/PPID|||
  |C|the usage of CPU|Unit is %|
  |PRI/NI|Priority/Nice. The priority of processes|the smaller it is, the higher the possibility of the process can be first executed by CPU is|
  |ADDR/SZ/WCHAN|ADDR: the location of the process in the memory; SZ: the usage memory of process; WCHAN: if the process is running|-: the process is running|
  |TTY|the location of the terminal|remote login is `pts/n`|
  |TIME|the actual running time of the process ||
  |CMD|commands||

* Table of outputs: `ps aux`
  |Column Name|Meaning|Note|
  |:---:|:---:|:---:|
  |USER|the process execute by which user||
  |PID|ID of the process||
  |%CPU|the rate of CPU usage||
  |%MEM|the rate of CPU memory usage||
  |VSZ|the amount of virtual CPU usage||
  |RSS|the amount of Resident Set Size||
  |TTY|the location of the terminal|?: unrelated to terminals. pts/n: connect the terminals by the internet|
  |STAT||same as `ps -l`|
  |START|the start time of the process to be activated||
  |TIME||same as `ps -l`|
  |COMMAND||same as `ps -l`|

##### Zombie
* COMMAND with `<defunct>`

#### top
* continuously check the processes

```bash


```