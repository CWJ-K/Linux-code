<!-- omit in toc -->
# Introduction

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [1. UID and GID](#1-uid-and-gid)
  - [2. etc/passwd](#2-etcpasswd)
  - [3. /etc/shadow](#3-etcshadow)
- [Commands](#commands)
  - [1. check id](#1-check-id)
  - [check the hashing functions of passwords](#check-the-hashing-functions-of-passwords)

<br />

# Fundamental Concepts

## 1. UID and GID
* Users' accounts can be identified by computers, which use UID 
  * mapping information of UID or GID and Account is stored in `/etc/passwd` or `/etc/group`
  * be aware of: do not modify the two files
  * Inner process to log in shell
    1. go through `etc/passwd` to search for the account
      1. if the account is not found, errors jump out
      2. if the account is found, go through `etc/group` to map `UID` and `GID` and also return `the home directory` and `the configures of shell`
    2. go through `etc/shadow`, to map the `account` and `uid` for `passwords`. Check if the password equals the one users type in
    3. log in shell


## 2. etc/passwd
* each line represents an account
  * important account should not be removed
    |Import Accounts|
    |:---:|
    |bin|
    |daemon|
    |adm|
    |nobody|
  * Essential columns
  
    |Position of Columns|1|2|3|4|5|6|7|
    |:---:|:---|:---|:---|:---|:---|:---|:---|
    |Meaning|Account|Password|UID|GID|User Information|Home Directory|Shell|
    |Note||`x`: can not be read|see next table||see `chfn`||`/sbin/nologin` can make users not log in shells|
    
    * UID

    |ID|Meaning|Note|
    |:---:|:---|:---|
    |0|system administrator, root||
    |1-999|for systems to use, |1-200: system account created by distributions|
    |||201-999: users can create accounts for systems|
    |1000-|general users||
 
## 3. /etc/shadow
* in the earlier days, passwords were stored in the second column of `etc/passwd`, which is not safe. Therefore, passwords are stored in `etc/shadow` with specific techniques
* Structure
  
  |Position of Columns|1|2|3|4|5|6|7|8|9|
  |:---:|:---|:---|:---|:---|:---|:---|:---|:---|:---|
  |Meaning|Account|Password|the last edited date|when passwords can be modified|when passwords should be updated|warning days before the fifth column|when passwords become invalid|when accounts become invalid|Option|
  |Note||only `root` can read, see permissions. Changing the length of passwords makes passwords invalid. Therefore, add `!` or `*` in front of the passwords to make passwords invalid |base date: `1970/1/1`; unit: second|`0`: can be changed anytime; `20`: passwords can be revised after 20 days from the last edited date|change your passwords after `x` days|warn users to change the passwords before the time passwords should be updated|after the fifth column, if passwords become invalid, systems will force users to change the passwords|base date: `1970/1/1`; unit: day. After the date, accounts can not be used|option column for future features|

* forget passwords
  * general users:
    * use `root` to reset passwords by the commands of `passwd`
  * root:
    * use different ways to log in linux and use the commands of `passwd`. e.g. reboot linux and enter single mode (TBC)
    * Use live CD ...

<br />

# Commands 

## 1. check id
```bash
  id <id_name>

```

## check the hashing functions of passwords

```bash
  authconfig --test | grep hashing
  

```