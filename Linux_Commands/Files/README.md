<!-- omit in toc -->
# Introduction

TODO

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [Do not delete files unless you know exactly what you are doing](#do-not-delete-files-unless-you-know-exactly-what-you-are-doing)
  - [Why are the structures of files in the different Linux distributions almost identical?](#why-are-the-structures-of-files-in-the-different-linux-distributions-almost-identical)
  - [FHS only defines three directories](#fhs-only-defines-three-directories)
    - [/](#)
    - [/usr](#usr)
    - [/var](#var)
- [Commands](#commands)
  - [cURL](#curl)

<br />

# Fundamental Concepts
## [Do not delete files unless you know exactly what you are doing](https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/tmp.html)
* Many of these files are important for currently running programs and deleting them may result in a system crash

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
  |/run|in the early, all the information about boot is stored in /var/run. Now, new FHS says it is stored in /run||
  |/sbin|contains binaries that are essential to the working of the system, including system administration as well as maintenance and hardware configuration programs|System Binaries|
  |/srv|contains site-specific data which is served by this system|service|
  |/tmp|contains mostly files that are required temporarily <br />Many programs use this to create lock files and for temporary storage of data||
  |/usr|contains by far the largest share of data on a system. <br />contains all the user binaries, their documentation, libraries, header files, etc.|Unix Software Resource|
  |/var|Contains variable data like system logging files, mail and printer spool directories, and transient and temporary files|variable|
  |/home|Linux is a multi-user environment so each user is also assigned a specific directory that is accessible only to them and the system administrator. <br /> contains your personal configuration files|suggested by FHS|
  |/lib<qual>|contains kernel modules and those shared library images needed to boot the system and run the commands in the root filesystem, ie. by binaries in /bin and /sbin|suggested by FHS|
  |/root|the home directory of the System Administrator|suggested by FHS|

* other directories should be known:
  |Directory|Meaning|Note|
  |:---:|:---:|
  |/lost+found|Systems might crash or a power failure might take the machine down. Some results before breaking down are stored in the directory and recover when rebooting systems|
  |/proc|also a virtual filesystem <br />  It doesn't contain 'real' files but runtime system information (e.g. system memory, devices mounted, hardware configuration, etc).  <br /> it is stored in memory, so it does not take disc spaces|Process|
  |/sys||

<br />

### /usr
* full name: Unix Software Resource
* goals:
  * even if mounting is only read, the systems still can operate
    * therefore, /sbin, /bin and /lib are moved into /usr for system rescue in some Linux distributions, which breaks the FHS rule.
* developers should put files into appropriate directories, instead of directories created by themselves
* the directory may use the most memories
* directories are required:
  |Directory|Meaning|Note|
  |:---:|:---:|:---:|
  |/usr/bin/|contain all commands users can use<br /> same as /bin. Connect /bin with /usr/bin/ <br />it is not suggested to add sub-directories in this directory ||
  |/usr/lib/|same as /lib||
  |/usr/local/|for the system administrator when installing software locally||
  |/usr/sbin/|same as /bin||
  |/usr/share/|contains read-only text files. The files can be shared among architecture platforms of a given OS||
* directories are suggested:
  |Directory|Meaning|Note|
  |:---:|:---:|:---:|
  |/usr/games/|files related to games||
  |/usr/include/|contains headers and include of c/c++ <br /> We will use the files in this directory if we install *.tar.gz files||
  |/usr/libexec/|includes internal binaries that are not intended to be executed directly by users or shell scripts||
  |/usr/lib<qual>/|same as /lib<qual>/||
  |/usr/src/|contain source codes|source|


<br />

### /var
* will become more after operating systems
  * files including cache, log file, lock file, run file, MySQL files

* Directories
  |Directory|Meaning|Note|
  |:---:|:---:|:---:|
  |/var/cache/|contains cache files from applications||
  |/var/lib/|||
  |/var/lock/|||
  |/var/log/|||
  |/var/mail/|||
  |/var/run/|||
  |/var/spool/|||










  
<br />

# Commands 

## [cURL](https://www.scribd.com/document/90229628/Curl-Manual)
* Write output to <file> instead of stdout
```s
    curl -o [Options] <URL>
```






