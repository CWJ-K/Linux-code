<!-- omit in toc -->
# Introduction

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [1. systemd-journald.service](#1-systemd-journaldservice)
- [Commands](#commands)
  - [journalctl](#journalctl)
    - [track real-time messages](#track-real-time-messages)
    - [store all logs even if reboot](#store-all-logs-even-if-reboot)
  - [logger](#logger)


<br />

# Fundamental Concepts

## 1. systemd-journald.service
* the benefit of using systemd to record logs
  * systemd is activated by kernels
  * it is the first program activated by machines
  * `systemd` can automatically call `systemd-journald` to record logs
* `systemd-journald` vs `rsyslogd`
  * `systemd-journald` records the current logs
    * sinces it uses memory to record logs
      * `/run/log` will be updated after restarting machines
        * see [this part](README.md#store-all-logs-even-if-reboot) to  store all logs
  * `rsyslogd` records the previous logs after restarting machines

<br />

# Commands 

## journalctl 
* take reference of `rsyslogd`


```bash
    journalctl [-nrpf] [--since TIME] [--until TIME] _optional
    '''
    -p: take reference of `rsyslogd`
    _SYSTEMD_UNIT=unit.service: the logs of unit.service
    _COMM=bash: the logs of bash
    _PID=pid: the logs of PID
    _UID=uid: the logs of UID
    SYSLOG_FACILITY=[0-23]: 
    '''
    journalctl _COMM=su _COMM=login -n 10
    journalctl _SYSTEMD_UNIT=crond.service -n 10
    journalctl SYSLOG_FACILITY=4 SYSLOG_FACILITY=10

```

### track real-time messages
* create two terminals
  * one terminal: `journalctl -f`
  * the other terminal: type commands whose logs will be tracked 

### store all logs even if reboot
1. create a directory: `/var/log/journal`
   1. modify permission
  > after rebooting, the log registry will copy logs to the directory
  > `/run/log` will not have logs since logs are all in `/var/log/journal`


```bash
    mkdir /var/log/journal
    chown root:systemed-journal /var/log/journal
    chmod 2775 /var/log/journal

```


## logger
* store your logs in the registry
* take references of rsyslogd
```bash
    logger [-p <service_name>.<level of log>] "<messages>"
    # take references of rsyslogd
```

* in the file of one service, record the start execution time and the end execution time
  
```bash
    #!/bin/bash

    if [ "${1}" == "log" ]; then
            logger -p syslog.info "backup.sh is starting"
    fi
    source="/etc /home /root /var/lib /var/spool/{cron,at,mail}"
    target="/backups/backup-system-$(date +%Y-%m-%d).tar.gz"
    [ ! -d /backups ] && mkdir /backups
    tar -zcvf ${target} ${source} &> /backups/backup.log
    if [ "${1}" == "log" ]; then
            logger -p syslog.info "backup.sh is finished"
    fi

```