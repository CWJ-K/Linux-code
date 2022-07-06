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
  |:---:|:---:|
  |/bin||
  |/boot||
  |/dev|||
  |/etc|||
  |/lib|||
  |/media|||
  |/mnt|||
  |/opt|||
  |/run|||
  |/sbin|||
  |/srv|||
  |/tmp|||
  |/usr|||
  |/var|||
  |/home||suggested by FHS|
  |/lib<qual>||suggested by FHS|
  |/root||suggested by FHS|

* other directories should be known:
  |Directory|Meaning|Note|
  |:---:|:---:|
  |/lost+found||
  |/proc||
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






