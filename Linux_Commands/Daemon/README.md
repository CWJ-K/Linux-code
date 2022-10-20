<!-- omit in toc -->
# Introduction

<br />

<!-- omit in toc -->
# Table of Contents

<br />

# Fundamental Concepts
## service
* always provides service for users
  * e.g. provide cron jobs

## daemon
* a program to execute the service
  * <filename>d
  * every service have a daemon for execution

## systemd 
* use systemd to manage services
  * command: systemctl 
* used in memory => on-demand
* call the scripts executed by daemon "unit"
* configuration files
  * /usr/lib/systemd/system/: systemd activates scripts
  * /run/systemd/system/
  * /etc/systemd/system/: includes many linked files

* types of unit
  * see `ll /usr/lib/systemd/system/`
  * table of types
    |Type|Meaning|
    |:---:|:---|
    |.service|common service type|
    |.socket||
    |.target|a collection of units: execute many services or sockets|
    |.mount; .automount||
    |.path|specific file or directory|
    |.timer|like cronjob, but provided by systemd|

<br />

# Commands 

## systemctl
* there are two ways to execute the service
  * when the machine boots, the services are also executed
  * users decide to execute the service
* use `systemctl` to stop the service instead of kill, which users can not monitor the service
```bash
    systemctl [command] [unit]

    systemctl status atd.service

    # can stop the services, including dependent services
    systemctl unmask [unit]

```

* types of active
  |Types|Meaning|
  |:---:|:---|
  |active (running)|services are running|
  |active (exited)|services only run once. There are no running services|
  |active (waiting)|waiting other services|
  |inactive|the service is not active|

* types of status in daemon
  |Types|Meaning|
  |:---:|:---|
  |enabled|the daemon will be executed when booting|
  |disabled|the daemon will not be executed when booting|
  |static|can not enable, but can be enabled by other services|
  |mask|can not enable anymore|

### check all services


```bash
    systemctl [command] [--type=TYPE] [--all]

    systemctl list-unit-files

    systemctl list-units --type=service --all

    systemctl list-units --type=service --all | grep cpu

```

### manage different target units

```bash
    systemctl list-units --type=target --all
    systemctl get-default
    systemctl set-default multi-user.target

    # reobtain graphical.target
    systemctl isolate graphical.target

    systemctl poweroff
    systemctl reboot

    # store data of systems in memory
    systemctl suspend 

    # store data of systems in disk
    systemctl hibernate

    systemctl rescue
    systemctl emergency 
```

### find the dependencies of services

```bash
    systemctl list-dependencies [unit] [--reverse]
    # --reverse: reverse to find the dependencies of services

```

### find the path of services

```bash
    systemctl list-sockets

```


### list the port of services
* ip is like your home. ports are the floors of your home
* protocol: define specific floors for specific services
  * WWW, httpd = 80. So www can connect with httpd


```bash 
    cat /etc/services

```

### disable the internet service
* internet service: the service with port
* if the internet service is not essential, disable it
```bash
  # see the current internet service
  netstat -tlunp

  # check the specific service with the internet
  systemctl list-units --all | grep <service>

  # disable the services
  systemctl stop <service>.service
  systemctl stop <service>.socket
  systemctl disable <service>.service <service>.socket



  netstat -tlunp
```

## tty
### getty
* 