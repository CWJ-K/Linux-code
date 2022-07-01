<!-- omit in toc -->
# Introduction
Introduce permission of files and directories and methods to change permission.

<br />

<!-- omit in toc -->
# Table Of Contents
- [Display permission <a name="Displaypermission"></a>](#display-permission-)
- [Outputs of Permission <a name="Introductionofpermission"></a>](#outputs-of-permission-)
  - [1. Full information <a name="Fullinformation"></a>](#1-full-information-)
  - [2. Permission <a name="Informationofpermission"></a>](#2-permission-)
    - [Meaning of Symbol](#meaning-of-symbol)
    - [Meaning of Permission](#meaning-of-permission)
  - [3. Root](#3-root)
- [How to change permission](#how-to-change-permission)
  - [chgrp](#chgrp)
  - [chown](#chown)
- [when to use chgrp, chown?](#when-to-use-chgrp-chown)
  - [copy](#copy)
  - [chmod](#chmod)

<br />

## Display permission <a name="Displaypermission"></a>
**ls**

  ```s
  ls --help
  ls -al <file_name>
  ```

<br />

## Outputs of Permission <a name="Introductionofpermission"></a>

<br />

### 1. Full information <a name="Fullinformation"></a>
**Example: dr-xr-xr-x. 17    root     root    4096  May  4 17:56 ..**

| Permission | Number of Link Files | Owner | Group | Size | Last updated time | Name of Files/Directories
:---: |:---: |:---:|:---:|:---:|:---:|:---: 
| dr-xr-xr-x. | 17 | root | root | 4096 | May  4 17:56 | .. |

<br />

### 2. Permission <a name="Informationofpermission"></a>
**Example: dr-xr-xr-x.**

<br />

#### Meaning of Symbol

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

#### Meaning of Permission

||File/Directory| Owner | Group | Other people 
:---: |:---: |:---:|:---:|:---:
||d|r-x|r-x|r-x|.
|Meaning|directory|owner can read and execute; <br> cannot write|people in the group can read and execute; <br> cannot write|other people can read and execute; <br> cannot write|
|Note|d : directory <br> - : file|

<br />

### 3. Root
If there is no permission set for root, root still can have full permission of any files and directories

<br />

## How to change permission
* `[-R]`: recursively change all files in the folder

<br />

### chgrp
* change group 
* the name of the group should exist in `/etc/group`

```s
chgrp [-R] <group_name> <dirname/filename>
```

<br />

### chown
* change the owner or the group of a file
* the name of the user should exist in `/etc/passwd`

```s
# change the owner
chown <user_name> <dirname/filename>

# change the owner and the group 
chown <user_name>:<group_name> <dirname/filename>
```

<br />

## when to use chgrp, chown?
### copy
* when using `copy`, the property of files, e.g. permission of owner, will also be copied. Therefore, it is required to change the permission when coping files to other people.

<br />

### chmod
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









