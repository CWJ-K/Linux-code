<!-- omit in toc -->
# Introduction


<br />

<!-- omit in toc -->
# Table of Contents

<br />

# Fundamental Concepts
## Types of task scheduler
### at
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
  * execute routine tasks

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
