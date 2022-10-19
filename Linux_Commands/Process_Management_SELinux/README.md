<!-- omit in toc -->

# Table of Contents
- [Table of Contents](#table-of-contents)
- [Fundamental Concepts](#fundamental-concepts)
  - [1. Process](#1-process)
  - [2. Process vs program](#2-process-vs-program)
  - [3. fork-and-exec](#3-fork-and-exec)
  - [4. daemon](#4-daemon)
  - [5. multi-people environment](#5-multi-people-environment)
  - [6. tasks are broken and stop. How to deal with them?](#6-tasks-are-broken-and-stop-how-to-deal-with-them)
  - [7. job control](#7-job-control)
  - [8. Priority](#8-priority)
    - [8.1. PRI](#81-pri)
    - [8.2. NICE](#82-nice)
- [Commands](#commands)
  - [1. make current tasks run in the daemon and users can do other tasks at the same time](#1-make-current-tasks-run-in-the-daemon-and-users-can-do-other-tasks-at-the-same-time)
  - [2. Stop the current task => throw tasks to the daemon](#2-stop-the-current-task--throw-tasks-to-the-daemon)
  - [3. throw tasks from the daemon to the foreground](#3-throw-tasks-from-the-daemon-to-the-foreground)
  - [4. run the job in the daemon](#4-run-the-job-in-the-daemon)
  - [5. remove the job in the daemon](#5-remove-the-job-in-the-daemon)
  - [6. Offline management](#6-offline-management)
    - [6.1. nohup](#61-nohup)
  - [7. Process Management](#7-process-management)
    - [7.1. Check the status](#71-check-the-status)
      - [7.1.1. ps](#711-ps)
        - [7.1.1.1. Zombie](#7111-zombie)
      - [7.1.2. top](#712-top)
      - [7.1.3. pstree](#713-pstree)
      - [7.1.4. free](#714-free)
      - [7.1.5. uname](#715-uname)
      - [7.1.6. uptime](#716-uptime)
      - [7.1.7. netstat](#717-netstat)
      - [7.1.8. dmesg](#718-dmesg)
      - [7.1.9. vmstat](#719-vmstat)
    - [7.2. Manage processes](#72-manage-processes)
      - [7.2.1. kill -signal PID](#721-kill--signal-pid)
      - [7.2.2. killall](#722-killall)
    - [7.3. Priority](#73-priority)
      - [7.3.1. nice](#731-nice)
      - [7.3.2. renice](#732-renice)
  - [8. SUID/SGID](#8-suidsgid)
    - [/proc/*](#proc)
  - [Find opened files or running systems](#find-opened-files-or-running-systems)
    - [fuser](#fuser)

<br />

# Fundamental Concepts

## 1. Process
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

## 2. Process vs program
  * process: a running program with a PID. The process is running in memory
  * program: binary program. An actual program to be stored 

<br />

## 3. fork-and-exec
* calling between processes
  * parent process forks a parent process 
  * the forked parent process executes the actual subprocess

<br />


## 4. daemon 
* services run in the background
  * the service can not be interactive with users, or it can not be run in the background
    * e.g. vim
  * can not be killed by `ctrl + c`
* if the suffix is with `d`, it implies using daemon
  * crond
  * atd
* only executes the tasks from the own bash. can not run the tasks from other bash.
  * even if `root`, it can not distribute tasks to other bash

## 5. multi-people environment
* everyone can change their configurations. related to 
  *  ~/.bashrc
  *  PID
* use `[Alt]+[F1].....[F7]` to switch the terminals of different people
  * the number of connections to the terminals are limited by `/etc/security/limits.conf`

## 6. tasks are broken and stop. How to deal with them?
* switch to other terminals
* `ps -aux` and find the broken process and `kill` it


<br />

## 7. job control
* running multiple tasks under the single terminal
* stdout and stderr should be sent to other files by data pipelines or foreground will be affected

<br />

## 8. Priority

### 8.1. PRI
* determined by kernal. So it can not be manually modified by users

### 8.2. NICE
* If users want to affect the priority, NICE can be used
  * PRI(new) = PRI(old) + nice
    * the range of nice determined by root:  -20 ~ 19
    * the range of nice determined by general users: 0 ~ 19
      * only can increase the value in case users occupy system resources

<br />

# Commands 

## 1. make current tasks run in the daemon and users can do other tasks at the same time
* use `&`
```bash
    # make copy running in the daemon
    cp file1 file2 &

    # output
    ## the first column is the number of job
    ## the second column is PID

```

## 2. Stop the current task => throw tasks to the daemon 
* `ctrl + Z`
  * the first column of output is the job number
    * `+`: the latest job
    * `-`: the oldest job
* stop the current tasks to make them wait in the daemon
* use `jobs` to see the status of the current tasks

```bash
  jobs [-lrs]

```


## 3. throw tasks from the daemon to the foreground
* will change the symbol `+` to the job processed by `fg`


```bash
  #  job number is the first column of jobs
  ## %: optional, without %, it takes the job with `+`

  fg %<job_number>

```

## 4. run the job in the daemon

```bash
  bg %<number_job>

  # check the change
  jobs; bg; jobs

  ## the command of the job with + ends with & 
```

## 5. remove the job in the daemon
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

## 6. Offline management
* Notes above all make jobs run in the daemon of bash, instead of a system
  * if the system becomes offline, jobs in the daemon will stop
* makes tasks run in the system
  * [`at`](/Linux_Commands/crontab/README.md)
  * `nohup` 

### 6.1. nohup
* does not support the internal commands of bash
  * execute .sh files
* even if you leave the system, the jobs still run

```bash
  nohup <commands or arguments>

  # execute in the daemon
  nohup <commands or arguments> &

```

## 7. Process Management

### 7.1. Check the status

#### 7.1.1. ps
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

##### 7.1.1.1. Zombie
* COMMAND with `<defunct>`

#### 7.1.2. top
* continuously check the processes
* can use `?` to find more arguments when using top
  * type `1` to switch to other cores
* swap should be less. If not, it implies the actual disk memory is not enough
  * the process of swap: if the disk memory is not enough, systems prioritize tasks and switch some tasks in swap to wait for systems, and then systems start to execute tasks in memory

```bash
  top [-d number] | top [-bnp]

  # update the information every two seconds
  ## default 5 seconds
  top -d 2

```
* the output of top
  |Symbol|Meaning|Note|
  |:---:|:---|:---|
  |PR|Priority|the smaller the number is, the earlier the task is executed|
  |NI|Nice|the smaller the number is, the earlier the task is executed|
  |TIME+|the accumulates time of CPU usage||

* sort top
  * type the first letter of the column
    * type `M`: sort %MEM
    * type `T`: sort TIME+
    * type `P`: sort %CPU
    * type `q`: leave
    * type `r`: assign values to nice

* check the current PID
  
  ```bash
    # look into the PID of the bash PID
    echo $$

    top -d 2 -p <PID>
  
  ```

#### 7.1.3. pstree
* find the relationships between processes
  * e.g. find the all processes of a specific bash PID (from a user). so you kill its all processes 

```bash
  pstree [-A|U] [-up]

```

#### 7.1.4. free 
* check the memory

```bash
  free [-b|-k|-m|-g|-h] [-t] [-s N -c N]

```
* the output of free
  ||Meaning|Note|
  |:---:|:---|:---|
  |total|total amount of memory||
  |used|the amount of memory in use||
  |free|the rest of memory can be used||
  |shared/buffers/cached|in the part of the amount of memory in use. It is used for buffer and cache||
  |available|||
* the amount of cache is generates from read/write/execute files. The files will be cached by systems to speed I/O
* it is normal that actual memory is run out of (because of cache), but swap can not be greater than 20%. If swap is higher, buy large actual memory 
  * [clearing cache will free RAM](https://serverfault.com/a/597141), but it causes the kernel to look for files on the **disk** rather than in the cache which can cause performance issues.
  * Normally the kernel will clear the cache when the available RAM is depleted. It frequently writes dirtied content to disk using pdflush.


#### 7.1.5. uname
* look into the information of systems and kernels

```bash
  uname [-asrmpi]

  uname -a

```

#### 7.1.6. uptime
* show the first column of `top`
* when the system boots and the loading

```bash
  uptime

```

#### 7.1.7. netstat 
* track internets
* table of columns
  |Column|Meaning|
  |:---:|:---|
  |Proto|Internet Protocal|
  |Local Address|local IP:port |
  |Foreign Address|remote IP:port|
  |State|Established or Listen|

```bash
  netstat -[atunlp]

  # find the internet connection listened by systems
  netstat -tulnp

  # close the internet connection by the informal method
  kill -9 <PID>
  killall -9 <job_name>
```

#### 7.1.8. dmesg 
* read the messages generated by kernels
  * when boosting, kernels check if the hardware of the system is monitored

```bash
  dmesg | more

  dmesg | grep -i vda

```

#### 7.1.9. vmstat 
* dynamically check the resource usage of systems
  * CPU/Memory/ Disk I/O

```bash
  vmstat [-a] [ <every x seconds> [<number of times>]]
  
  # memory
  vmstat [-fs]

  # set the unit of display
  vmstat [-S <unit>]  

  # related to disk
  vmstat [-d] 

  # related to partitions
  vmstat [-p <partition>]  


```


### 7.2. Manage processes
* give a signal to manage processes
  * list all available signals: `kill -k`
  * common signals
    |Signals|Name|Meaning|
    |:---:|:---:|:---|
    |1|SIGHUP|make the PID reread it's configurations = restart|
    |9|SIGKILL|force the PID to stop. `.filename.swp` will be kept|
    |15|SIGTERM|stop the PID in a normal way. However, if there are issues in the process, the signal will not work out |

#### 7.2.1. kill -signal PID
* pass the signal to processes
* if `kill %<job number>`, see [remove jobs](README.md#remove-the-job-in-the-daemon)
* is compared with `ps` and `pstree` to get PID  

```bash
  kill -signal PID

  ## important!!
  # ps aux | grep 'rsyslogd' | grep -v 'grep'| awk '{print $2}'

  kill -SIGHUP $(ps aux | grep 'rsyslogd' | grep -v 'grep'| awk '{print $2}')

  # check if the process restarts
  tail -5 /var/log/messages
```


#### 7.2.2. killall
* different from kill, killall requires the name of command instead of PID

```bash
  killall [-iIe] [command name]

```

### 7.3. Priority

#### 7.3.1. nice
* create a new job and assign the value of nice

```bash
  nice [-n number] command

  nice -n -5 vim&

```

#### 7.3.2. renice

```bash
  renice [number] PID

```

## 8. SUID/SGID 
### /proc/*
* all data of memory are stored here

```bash
  ls -al /proc

  ls -al /proc/<PID>
  cat /proc/<PID>
```

* Table of files under /proc
  |File|Meaning|
  |:---:|:---|
  |/proc/cmdline|know how to activate kernels|
  |/proc/cpuinfo|the information of CPU|
  |/proc/devices|related to `mknod`|
  |/proc/filesystems|files are mounted in the system|
  |/proc/interrupts|the distribution of IRQ |
  |/proc/ioports|I/O address of devices|
  |/proc/kcore|the size of memory|
  |/proc/loadavg|related to `top`, `uptime`|
  |/proc/meminfo|related to `free`|
  |/proc/modules||
  |/proc/mounts||
  |/proc/swaps||
  |/proc/partitions|related to `fdisk -l `|
  |/proc/uptime|`uptime `|
  |/proc/version|`uname -a`|
  |/proc/bus/*||


## Find opened files or running systems

### fuser
* find which systems are using the file
  * different from pstree

```bash
  fuser [-umv] [-k [i] [-signal]] file/dir

  # .: current directory 
  fuser -uv .

  fuser -muv .

  # even if you do use the directory, the file is still mounted, so use below commands to delete
  fuser -mki /home
```