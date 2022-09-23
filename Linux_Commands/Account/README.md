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
  - [ACL](#acl)
- [Commands](#commands)
  - [1. check id](#1-check-id)
  - [2. check the hashing functions of passwords](#2-check-the-hashing-functions-of-passwords)
  - [3. Groups](#3-groups)
    - [3.1. check a user's groups](#31-check-a-users-groups)
    - [3.2. see all groups in which the currently user](#32-see-all-groups-in-which-the-currently-user)
    - [3.3. switch the effective group](#33-switch-the-effective-group)
  - [4. Account Management](#4-account-management)
    - [4.1. add users](#41-add-users)
    - [4.2. change passwords](#42-change-passwords)
    - [4.3. change](#43-change)
    - [4.4. usermod](#44-usermod)
    - [4.5. userdel](#45-userdel)
  - [5. general users manage accounts](#5-general-users-manage-accounts)
    - [5.1. id](#51-id)
    - [5.2. finger](#52-finger)
    - [chfn](#chfn)
    - [chsh](#chsh)
  - [Group Management](#group-management)
    - [groupadd](#groupadd)
    - [groupmod](#groupmod)
    - [groupdel](#groupdel)
    - [gpasswd](#gpasswd)
  - [Practice](#practice)
    - [Practice 1](#practice-1)
    - [Practice 2](#practice-2)
    - [Practice3](#practice3)
  - [ACL](#acl-1)
    - [check if there is ACL in the system](#check-if-there-is-acl-in-the-system)
    - [setfacl](#setfacl)
    - [getfacl,](#getfacl)

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
* default arguments are called from `/etc/login.defs`

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


## ACL
* Access Control List 
* set more detailed configurations for `owner, group, other`

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
  * `/etc/group` and `/etc/gshadow`: create a group whose name is same as the new user
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

* default arguments of users
  * in CentOS, the default group name is the same as the user's name. Otherwise, it is the same as `users` (GID=100)
    * Because of two systems
      1. Private group 
        * more secured
        * give the default group name is the same as the user's name
        * the permission of the home directory is 700 (only myself)
        * e.g. RHEL, Fedora, CentOS
      2. Public group
        * use GROUP=100 as the user's initial group
          * everyone can share files in the group of `users`
        * e.g. SuSE

```bash
  # default values of useradd
  ## call from /etc/default/useradd

  useradd -D
  

```
* when creating a new user, the files below are all used:
  * /etc/default/useradd
  * /etc/login.defs
  * /etc/skel/*


### 4.2. change passwords
* default: after `useradd`, the account is still blocked. See the second column of `/etc/shadow `
* assign passwords to users by `root`
  * be aware of, if `passwd` without account id, it implies using `root` to change root's passwords
  * recommend to use `passwd account_id`
* Use `PAM` module to manage passwords `/etc/pam.d/passwd `

```bash
  passwd [--stdin] [account ID] 

  # use stdin to change password
  ## advantage: easy to set passwords. Commonly used for users to loging in by default passwords at the first time and change passwords by users
  ## disadvantage: password will be stored in history => /root/.bash_history

  echo "passwd" | passwd --stdin vbird2

  # display the information of passwords
  passwd -S
```

### 4.3. change
* display the detailed information of passwords


```bash
  chage [-ldEImMW] account_id


  # user login in by their name and change their passwords
  useradd account_id
  echo "account_id" | passwd --stdin agetest
  chage -d 0 account_id
  chage -l account_id | head -n 3
```

### 4.4. usermod
* change the configurations of `useradd` by two methods
  1. usermod
  2. modify `/etc/passwd` or `/etc/shadow`   

```bash
  usermod [-cdegGlsuLU] username

```

### 4.5. userdel
* be aware of, if you do not want the information of the user
  * if not,
    * manually remove the account in `/etc/passwd, /etc/shadow`
    * or make accounts invalid: set the eighth column of `/etc/shadow` to `0`
* delete the information of users
  * `/etc/passwd, /etc/shadow`
  * `/etc/group, /etc/gshadow`
  * `/home/username, /var/spool/mail/username..`

```bash
  # before deleting the account, check their files
  find / -user username 

  userdel [-r] username
  # -r: include directory
```

## 5. general users manage accounts

### 5.1. id
* see the information of accountsID

```bash
  id [username]

```

### 5.2. finger
* display the information (`/etc/passwd`) of a user
* or use `grep <user_name> \etc\passwd`

### chfn
* change finger

```bash
  chfn [-foph] [account]
  '''
  -f: add full name
  -o: add office room
  -p: add office number
  -h: add home number
  '''


```

### chsh
* change shell

```bash
  chsh [-ls]
  # -l: list the shell of the system, which is the content of /etc/shells 
  # -s: modify the shell

```

## Group Management
### groupadd

```bash
  # GID+1
  groupadd [-g gid] [-r] group_name

```

### groupmod
* similar as `usermod`

```bash
  groupmod [-g gid] [-n group_name] group_name
  '''
  -g  ：revise the number of the gid
  -n  ：revise the name of the group
  '''

```

### groupdel
* delete the group if it is not the initial group of users
  * check the fourth column of `/etc/passwd`
```bash
  groupdel [group_name]

```

### gpasswd
* create a group manager to manage groups instead of `root`
  * e.g. let other people to add members

```bash
  # root
  gpasswd groupname
  gpasswd [-A user1,...] [-M user3,...] groupname
  gpasswd [-rR] groupname

  # group manager 
  gpasswd [-ad] user groupname
```


## Practice
### Practice 1
* Question: make the table realistic 
  |Account|Account full name|supported sub group|enable to log in systems|password|
  |:---:|:---:|:---:|:---:|:---:|
  |myuser1|1st user|mygroup1|Yes|password|
  |myuser2|2nd user|mygroup1|Yes|password|
  |myuser3|3rd user|No|No|password|

```bash
  # Related to accounts
  groupadd mygroup1
  useradd -G mygroup1 -c "1st user" myuser1
  useradd -G mygroup1 -c "2nd user" myuser2
  useradd -c "3rd user" -s /sbin/nologin myuser3 # because it can not log in systems
  
  # Related to passwords
  echo "password" | passwd --stdin myuser1
  echo "password" | passwd --stdin myuser2
  echo "password" | passwd --stdin myuser3

```


### Practice 2
* make three users work in the same directory, but they all have their own home directories and basic private group. Assume they work under /srv/projecta

```bash
  # add them to the same group
  groupadd mygroup1
  useradd -G mygroup1 -c "1st user" myuser1
  useradd -G mygroup1 -c "2nd user" myuser2
  useradd -G mygroup1 -c "2nd user" myuser3
  
  echo "password" | passwd --stdin myuser1
  echo "password" | passwd --stdin myuser2
  echo "password" | passwd --stdin myuser3

  mkdir /src/projecta
  chgrp mygroup1 /src/projecta
  chmod 2770 /srv/projecta
  ll -d /src/projecta

```

### Practice3
* let one person can access the group of practice2, but the person can not edit 
  * use `ACL`


## ACL
### check if there is ACL in the system

```bash
  dmesg | grep -i acl

```

### setfacl
* set the ACL configurations of a file/ directory


```bash
  setfacl [-bkRd] [{-m|-x} acl arguments ] file/directory
  
  # practice
  touch <file>
  setfacl -m u:<account>:rx <file>  # + appear

  setfacl -m u::rx <file> # without account, it implies the owner of the files

```

### getfacl, 
* get the ACL configurations of a file/ directory

```bash
  getfacl filename

```