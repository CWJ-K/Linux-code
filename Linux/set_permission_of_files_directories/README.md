
# How to set permission of files and directories

# Table of contents
1. [Display permission](#Displaypermission)
2. [Introduction of permission](#Introductionofpermission)
    1. [Full information](#Fullinformation)
    2. [Information of permission](#Informationofpermission)


## Display permission <a name="Displaypermission"></a>
**ls**
* ls --help
* ls -al

## Introduction of permission <a name="Introductionofpermission"></a>
### 1. Full information <a name="Fullinformation"></a>
**Example: dr-xr-xr-x. 17    root     root    4096  May  4 17:56 ..**

| Permission | Number of Link Files | Owner | Group | Size | Last updated time | Name of Files/Directories
:---: |:---: |:---:|:---:|:---:|:---:|:---: 
| dr-xr-xr-x. | 17 | root | root | 4096 | May  4 17:56 | .. |

### 2. Information of permission <a name="Informationofpermission"></a>
**Example: dr-xr-xr-x.**

* Meaning of Symbol

||r|w|x|-|
:---:|:---:|:---:|:---:|:---:|
|Meaning|Read|Write|Execution|No Permission of this position|
|Note|||Can enter and execute files or directories |

* Meaning of Permission

||File/Directory| Owner | Group | Other people 
:---: |:---: |:---:|:---:|:---:
||d|r-x|r-x|r-x|.
|Meaning|directory|owner can read and execute; <br> cannot write|people in the group can read and execute; <br> cannot write|other people can read and execute; <br> cannot write|
|Note|d : directory <br> - : file|

### 3. Root
If there is no permission set for root, root still can have full permission of any files and directories

## How to change permission
chgrp: change group
chown: change owner
chmod: chagne mode
-R: recursive, all files in the same directory



