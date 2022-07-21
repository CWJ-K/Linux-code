<!-- omit in toc -->
# Introduction
Introduce permission of files and directories and methods to change permission.

<br />

<!-- omit in toc -->
# Table Of Contents
- [1. Display permission <a name="Displaypermission"></a>](#1-display-permission-)
- [2. Outputs of Permission <a name="Introductionofpermission"></a>](#2-outputs-of-permission-)
  - [2.1. Full information <a name="Fullinformation"></a>](#21-full-information-)
  - [2.2. Permission <a name="Informationofpermission"></a>](#22-permission-)
    - [2.2.1. Meaning of Symbol](#221-meaning-of-symbol)
    - [2.2.2. Meaning of Permission](#222-meaning-of-permission)
  - [2.3. Root](#23-root)
- [3. How to change permission](#3-how-to-change-permission)
  - [3.1. chgrp](#31-chgrp)
  - [3.2. chown](#32-chown)
- [4. when to use chgrp, chown?](#4-when-to-use-chgrp-chown)
  - [4.1. copy](#41-copy)
  - [4.2. chmod](#42-chmod)

<br />

## 1. Display permission <a name="Displaypermission"></a>
**ls**

  ```s
  ls --help
  ls -al <file_name>
  ```

<br />

## 2. Outputs of Permission <a name="Introductionofpermission"></a>

<br />

### 2.1. Full information <a name="Fullinformation"></a>
**Example: dr-xr-xr-x. 17    root     root    4096  May  4 17:56 ..**

| Permission | Number of Link Files | Owner | Group | Size | Last updated time | Name of Files/Directories
:---: |:---: |:---:|:---:|:---:|:---:|:---: 
| dr-xr-xr-x. | 17 | root | root | 4096 | May  4 17:56 | .. |

<br />

### 2.2. Permission <a name="Informationofpermission"></a>
**Example: dr-xr-xr-x.**

<br />

#### 2.2.1. Meaning of Symbol

||r|w|x|-|
|:---:|:---:|:---:|:---:|:---:|
|Meaning|Read|Write|Execution|No Permission of this position|
|Note||*|Can **enter** and **execute** files or directories |


* for files:
  > `rwx` are used to operate the content of files or directories instead of the existence of files or directories
  ||r|w|x|-|
  |:---:|:---:|:---:|:---:|:---:|
  |Meaning|Read|Write|Execution|No Permission of this position|
  |Note||can not **delete** files; only **write**, **edit**, **add**, **revise**|Can **execute** files|

* for directories
  > `rwx` are used to operate the content of directories
  ||r|w|x|-|
  |:---:|:---:|:---:|:---:|:---:|
  |Meaning|Read|Write|Execution|No Permission of this position|
  |Note||can **write**, **edit**, **add**, **revise**, **delete** files => **the change of the content of directories**|Can **enter** files|

  * enables other people to see the contents of the directory
    * should have `r` and `x`

  * `w` can not assign to anyone
    * even if other people have no permission to delete specific files in the directory, they can delete the whole directory because they have permission to delete the directory.

<br />

#### 2.2.2. Meaning of Permission

||File/Directory| Owner | Group | Other people 
:---: |:---: |:---:|:---:|:---:
||d|r-x|r-x|r-x|.
|Meaning|directory|owner can read and execute; <br> cannot write|people in the group can read and execute; <br> cannot write|other people can read and execute; <br> cannot write|
|Note|d : directory <br> - : file|

<br />

### 2.3. Root
If there is no permission set for root, root still can have full permission of any files and directories

<br />

## 3. How to change permission
* `[-R]`: recursively change all files in the folder

<br />

### 3.1. chgrp
* change group 
* the name of the group should exist in `/etc/group`

```s
chgrp [-R] <group_name> <dirname/filename>
```

<br />

### 3.2. chown
* change the owner or the group of a file
* the name of the user should exist in `/etc/passwd`

```s
# change the owner
chown <user_name> <dirname/filename>

# change the owner and the group 
chown <user_name>:<group_name> <dirname/filename>
```

<br />

## 4. when to use chgrp, chown?

### 4.1. copy
* when using `copy`, the property of files, e.g. permission of owner, will also be copied. Therefore, it is required to change the permission when coping files to other people.

<br />

### 4.2. chmod
* change modes of permission of files/directories
* Two Methods:
  * Use Numbers
    |Mode|Number|
    |:---:|:---:|
    |r|4|
    |w|2|
    |x|1|
    * e.g. -rwxrwx--- 
      |Role|Permission|Number|
      |:---:|:---:|:---:|
      |user|rwx|7|
      |Group|rwx|7|
      |Other|---|0|

      ```s
      chmod [-R] 770 <dirname/filename>
      ```
    * Use Cases: 
      1. make a file be executed but not be revised
        ```s
        # -rwxr-xr-x
        chmod 755 <file>
        ```
      2. make a file not be seen by other people
        ```s
        # -rwxr-----
        chmod 740 <file>
        ```
  * Use Characters
    |Role|Character|Action|Character|
    |:---:|:---:|:---:|:---:|
    |user|u|+|add|
    |group|g|-|remove|
    |other|o|=|set|
    |all users|a||

    * e.g. -rwxr-xr-x
      > no spaces after a comma
      ```s
      chmod  u=rwx,go=rx  <file>
      ```

<br />


# umask
* assign default permission to files
* file, the max number is 666 because files are for data storage and they do not need to be executed
* folder, the max number is 777 because folders to be executed imply users can enter folders
* when to use
  * if multiple users use the same machines
  > annoying to change the permission of folders one by one 
  > when a file is created, the newly default permission is set
```s
  # check default permission by number
  # means 7 minus number => permission
  # 0222 => permission: 7555; take off permission of write
  umask

  # check default permission by strings
  umask -S

  # set permission
  umask <number>

```

<br />





