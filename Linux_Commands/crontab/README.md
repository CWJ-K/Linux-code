<!-- omit in toc -->
# Introduction


<br />

<!-- omit in toc -->
# Table of Contents

<br />

# Fundamental Concepts
## Types of task scheduler
### at
  * the smallest unit is minutes
  * only execute a task one time
  * require `atd`
  * process of at:
    1. use `at` to generate tasks
    2. use scripts to write the tasks into `/var/spool/at/`
    3. `atd` will execute the tasks
  * security
    * to avoid cracker programs, only accounts approved by users can use `at` 
      * if `/etc/at.allow` exists
        * only users in the file can use `at`
      * if `/etc/at.deny` exists
        * users in the file can not use `at`
      * both files do not exist
        * only `root` can use `at`
### cron
  * the smallest unit is minutes
  * execute routine tasks
  * security
    * to avoid cracker programs, only accounts approved by users can use `crontab` 
    * if `/etc/cron.allow` exists
      * only users in the file can use `crontab`
    * if `/etc/cron.deny` exists
      * users in the file can not use `crontab`
    * recommend to only keep one file
  * **task schedule** are stored into `/var/spool/cron/<user_account>`
    * task schedule are categorized by user accounts 
    * do not use `vi` to edit the file, or tasks will be affected
  * the history of jobs are stored into `/var/log/cron`

## routine tasks in Linux
* log rotate
  * old logs will be moved to other places 
  * avoid running out of spaces
* logwatch
  * logwatch analyze logs to check errors in software, security ...etc.b
* build and update the database of locate
  * information of files are stored in /var/lib/mlocate/
  * automatically update the database
* update man page
  * automatically update the man page via `mandb`
* refresh RPM
* remove temporal files
  * via `tmpwatch`
* update authentication of webs
  * update invalid authentication


<br />

# Commands 

## at
* activate `atd` 

```bash
    systemctl restart atd 
    # let atd to be activated when booting
    systemctl enable atd

    systemctl status atd
```

* tasks
    * use `absolute path` to execute commands
      * since commands are executed in at shell
    * tasks are executed in the daemon. so the tasks can work offline
  
```bash
    # ctrl + d to leave at shell
    at [-mldv] TIME
    at -c job_number
    '''
    -m: tell users the tasks are finished via emails
    -l: atq, display the current at jobs
    -d: atrm. cancel the task 
    -v: display the current at jobs in the format of time
    -c: commands of the task
    '''

    at now + 5 minutes

    # use atq to see the jon number
    atrm job_number
```

### batch
* managed by atq/atrm
* execute tasks only when systems are available
  * when the loading of CPU < 0.8, tasks start to be executed
    * the number of tasks CPU runs at a single point in time


## crontab

```bash
  crontab [-u username] [-l|-e|-r]
  '''
  -u: only root can execute the task => remove or add crontab for other users
  -e: edit the content of crontab  => only one task
  -l: check the content of crontab
  -r: remove all contents of crontab  => all tasks
  '''

```
* Time formats
  |Meaning|minute|hour|day|month|week|command|
  |:---:|:---:|:---:|:---:|:---:|:---:|:---:|
  |Range|0-59|0-23|1-30|1-12|0-7||

* Symbol
  |Symbol|Meaning|Example|
  |:---:|:---:|:---:|
  |*|anytime||
  |,|divide time. tasks will be executed in the divided time|3,6 => 3:00 and 6:00|
  |-|a range of time|8-12: 8:00~12:00|
  |/n|unit gap|tasks run every x minutes.  0-59/5 = */5: every 5 minutes|