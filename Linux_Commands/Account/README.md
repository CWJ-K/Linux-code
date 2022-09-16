<!-- omit in toc -->
# Introduction

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [1. UID and GID](#1-uid-and-gid)
  - [2. Individual](#2-individual)
    - [2.1. etc/passwd](#21-etcpasswd)
    - [2.2. /etc/shadow](#22-etcshadow)
  - [3. Group](#3-group)
    - [3.1. /etc/group](#31-etcgroup)
      - [3.1.1. effective group](#311-effective-group)
      - [3.1.2. initial group](#312-initial-group)
    - [3.2. /etc/gshadow](#32-etcgshadow)
- [Commands](#commands)
  - [1. check id](#1-check-id)
  - [2. check the hashing functions of passwords](#2-check-the-hashing-functions-of-passwords)
  - [3. Groups](#3-groups)
    - [3.1. check a user's groups](#31-check-a-users-groups)
    - [3.2. see all groups in which the currently user](#32-see-all-groups-in-which-the-currently-user)
    - [3.3. switch the effective group](#33-switch-the-effective-group)
  - [4. Account Management](#4-account-management)
    - [4.1. add users](#41-add-users)

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

## 2. Individual

### 2.1. etc/passwd
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
 
### 2.2. /etc/shadow
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

## 3. Group

### 3.1. /etc/group
|Position of Columns|1|2|3|4|
|:---:|:---|:---|:---|:---|
|Meaning|Group Name for humans|Group password|Group ID|supported accounts in the group|
|Note||for system administers. passwords are moved to `/etc/gshadow`||users' accounts in the same group|

#### 3.1.1. effective group
* when a new file is created, the user's effective group will be given to it 

#### 3.1.2. initial group
* GID of a user
* without the fourth column - supported accounts in the group


### 3.2. /etc/gshadow
* Two methods to add a user in different groups
  1. use `usermod` as `root`
  2. use `/etc/gshadow` to create a group manager. The group manager can add other people to the group => not commonly used because of `sudo`

|Position of Columns|1|2|3|4|
|:---:|:---|:---|:---|:---|
|Meaning|Group Name for humans|Group password|Group ID|supported accounts in the group|
|Note||for system administers. if `!` or ` `, it implies there is no group manager in the group||users' accounts in the same group|


<br />

# Commands 

## 1. check id
```bash
  id <id_name>

```

## 2. check the hashing functions of passwords

```bash
  authconfig --test | grep hashing
  

```

## 3. Groups

### 3.1. check a user's groups
```bash
  grep <username> /etc/passwd /etc/group /etc/gshadow

```

### 3.2. see all groups in which the currently user
```bash
  # the first group is the effective group
  groups

```

### 3.3. switch the effective group
* only switch to other group in which the user is
* use a new shell to switch the group, so exit the shell 
```bash
  newgrp <group_name>

  exit  # exit newgrp

```

## 4. Account Management

### 4.1. add users
* there are many defaults settings for a new user
  * `/etc/passwd`: create one line for this account (UID/GID/home directory)
  * `/etc/shadow`: fill in the arguments of the password, but without the password
  * `/etc/group`: create a group whose name is same as the new user
  * `/home`: create a home director whose name is same as the new user. the permission is 700


```bash
  # the initial group is 1000 => /etc/group search for 1000
  useradd [OPTIONS] USERNAME
  '''
  -u: UID
  -g: initial group
  -G: secondary group
  -m: forced. do not create the home directory
  -M: forced. do create the home directory
  -c: explanation
  -d: the absolute path of the home directory
  -s: shell
  -e: account invalid date
  -f:　passwords invalid date
  '''
  
```