<!-- omit in toc -->
# Introduction
Introduce permission of files and directories and methods to change permission.

<br />
<!-- omit in toc -->

# Table Of Contents
- [Table Of Contents](#table-of-contents)
  - [Display permission <a name="Displaypermission"></a>](#display-permission-)
  - [Outputs of Permission <a name="Introductionofpermission"></a>](#outputs-of-permission-)
    - [1. Full information <a name="Fullinformation"></a>](#1-full-information-)
    - [2. Permission <a name="Informationofpermission"></a>](#2-permission-)
      - [Meaning of Symbol](#meaning-of-symbol)
      - [Meaning of Permission](#meaning-of-permission)
    - [3. Root](#3-root)
  - [How to change permission](#how-to-change-permission)

<br />

## Display permission <a name="Displaypermission"></a>
**ls**

        ls --help
        ls -al

<br />

## Outputs of Permission <a name="Introductionofpermission"></a>

<br />

### 1. Full information <a name="Fullinformation"></a>
**Example: dr-xr-xr-x. 17    root     root    4096  May  4 17:56 ..**

| Permission | Number of Link Files | Owner | Group | Size | Last updated time | Name of Files/Directories
:---: |:---: |:---:|:---:|:---:|:---:|:---: 
| dr-xr-xr-x. | 17 | root | root | 4096 | May  4 17:56 | .. |

### 2. Permission <a name="Informationofpermission"></a>
**Example: dr-xr-xr-x.**

#### Meaning of Symbol

||r|w|x|-|
:---:|:---:|:---:|:---:|:---:|
|Meaning|Read|Write|Execution|No Permission of this position|
|Note|||Can enter and execute files or directories |

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
chgrp: change group <br />
chown: change owner <br />
chmod: chagne mode <br />
-R: recursive, all files in the same directory



