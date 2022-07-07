<!-- omit in toc -->
# Introduction

TODO

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [Why are the structures of files in the different Linux distributions almost identical?](#why-are-the-structures-of-files-in-the-different-linux-distributions-almost-identical)
  - [FHS only defines three directories](#fhs-only-defines-three-directories)
    - [/](#)
    - [/usr](#usr)
- [Commands](#commands)
  - [cURL](#curl)

<br />

# Fundamental Concepts
## Why are the structures of files in the different Linux distributions almost identical?
* Filesystem Hierarchy Standard (FHS) makes sure that users can understand the location of installed software.

* enables users to change files

||shareable|unshareable|
|:---:|:---:|:---:|
|**static**|/usr (location of softwares)|/etc (configs)|
||/opt (third parties of softwares)|/boot (boot and kernel)|
|**variable**|/var/mail (mails of users)|/var/run (related to programs)|
||/var/spool/news (groups of news)|/var/lock (related to programs)|

  * shareable: can share directories to other machines
  * unshareable: files related to own machine and problems. So, they can not be shared with other machines
  * static: some files are not changed followed by distributions
  * changeable: files are frequently changed

<br />

## FHS only defines three directories 
  |Directory|Meaning|Files related to|
  |:---:|:---:|:---:|
  |/|root|boot systems|
  |/usr|unix software resource|software installation and execution|
  |/var|variable|operations of systems|

<br />

### /
* include files related to repair, booting of systems
* is so important that partition of `/` should be smaller for efficiency (TBC) 
* `/` and softwares should not be put in the same partition (TBC)
* required sub-directories should in `/`:
  > even though the sub-directories do not exist, it is suggested to create them in `/`

  |Directory|Meaning|Note|
  |:---:|:---|:---:|
  |/bin|contains **commands** that are of use to both the system administrator as well as non-privileged users, e.g. cat, chmod, chown, date, mv, mkdir, cp, bash|Binary|
  |/boot|contains everything required for the **boot process** except for configuration files not needed at boot time and the map installer||
  |/dev|the location of special or device files, e.g. /dev/null, /dev/zero, /dev/tty, /dev/loop*, /dev/sd*|Device|
  |/etc|contains all system related configuration files in here or in its sub-directories e.g. /etc/modprobe.d/, /etc/passwd, /etc/fstab, /etc/issue, <br /> /etc/opt(required): for third party software, <br />/etc/X11/(suggested): for X Windows <br /> /etc/sgml/(suggested) <br /> /etc/xml/(suggested)|Editable Text Configuration|
  |/lib|contains kernel modules and those shared library images needed to boot the system and run the commands in the root filesystem, ie. by binaries in /bin and /sbin|library|
  |/media|containing removable media, e.g. CD, DVD.. etc. <br /> common files: /media/floppy, /media/cdrom||
  |/mnt|Mounting is the process by which you make a filesystem available to the system. After mounting your files will be accessible under the mount-point|mount|
  |/opt|for all the software and add-on packages that are not part of the default installation (third party softwares)|Optional|
  |/run|||
  |/sbin|contains binaries that are essential to the working of the system, including system administration as well as maintenance and hardware configuration programs|System Binaries|
  |/srv|||
  |/tmp|||
  |/usr|||
  |/var|||
  |/home|Linux is a multi-user environment so each user is also assigned a specific directory that is accessible only to them and the system administrator. <br /> contains your personal configuration files|suggested by FHS|
  |/lib<qual>||suggested by FHS|
  |/root||suggested by FHS|

* other directories should be known:
  |Directory|Meaning|Note|
  |:---:|:---:|
  |/lost+found|Systems might crash or a power failure might take the machine down. Some results before breaking down are stored in the directory and recover when rebooting systems|
  |/proc|also a virtual filesystem <br />  It doesn't contain 'real' files but runtime system information (e.g. system memory, devices mounted, hardware configuration, etc).  <br /> it is stored in memory, so it does not take disc spaces|Process|
  |/sys||

<br />

### /usr
* Unix Software Resource
* goals:
  * even if mounting is only read, the systems still can operate
    * therefore, /sbin, /bin and /lib are moved into /usr for system rescue in some Linux distributions, which breaks the FHS rule.
* developers should put files into appropriate directories, instead of directories created by themselves
* the directory may use the most memories
  










  
<br />

# Commands 

## [cURL](https://www.scribd.com/document/90229628/Curl-Manual)
* Write output to <file> instead of stdout
```s
    curl -o [Options] <URL>
```






