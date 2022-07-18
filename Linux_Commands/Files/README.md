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
  - [directory tree](#directory-tree)
  - [Path](#path)
    - [absolute path](#absolute-path)
    - [relative path](#relative-path)
  - [Directory Table](#directory-table)
- [Commands](#commands)
  - [Directory](#directory)
    - [cd](#cd)
    - [pwd](#pwd)
    - [mkdir](#mkdir)
    - [rmdir](#rmdir)
  - [cURL](#curl)
  - [why can we use `ls`?](#why-can-we-use-ls)
    - [Environment Path](#environment-path)
    - [`ls`](#ls)
  - [Copy](#copy)
  - [Remove](#remove)
  - [Move](#move)

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
  |/var/lib/|contains the files required for applications||
  |/var/lock/|lock files for devices and other resources in case they are used by multiple devices at the same time||
  |/var/log/|contains important log files e.g. /var/log/messages, /var/log/wtmp||
  |/var/mail/|same as /var/spool/mail/ <bt /> contains the directory of emails||
  |/var/run/|same as /run <bt /> This directory was once intended for system information data **describing** the system since it was booted||
  |/var/spool/|contains data which is awaiting some kind of later processing <bt /> after processing, the data will be removed||

<br />

## directory tree
* the start point of the directory tree is `/`, `root`
* can mount to filesystem of the Internet by Network File System (NFS)
* the names of files are identical in the directory tree 

<br />

## Path
### absolute path
* start from `/`
  * e.g. /home/dmtsai/.bashrc
* use absolute path for accuracy
  > relative path will change according to working environment  

<br />

### relative path
* start from `./` (current directory)
  * e.g. ./home/dmtsai
* `../`: the layer up one level of the current directory

<br />

## Directory Table
|Symbol|Directory|
|:---:|:---|
|`.`|current directory|
|`..`|the layer up one level of the current directory|
|`-`|previous working directory|
|`~`|home directory of the current user|
|`~account`|home directory of the account|

  
<br />

# Commands 
* use `tab` in Linux to automatically fill names

<br />

## Directory
### cd
* change directory


```s
  cd <path_to_directory>
```

<br />

### pwd
* print working directory

```s
# show the current directory => linking file
pwd

# show the complete directory
pwd -P

## see why
ls -ld <current_directory>

```

<br />

### mkdir
* make directory
* `mkdir -p` becomes annoying when there are typos in file names

```s
# create a file
mkdir <file_name>

# create new files recursively. Exiting files will be skipped

mkdir -p <file_name1/file_name2..>

# set permission of new file. Without, the permission will be set default property (TBC-umask)
mkdir -m <number_of_permission> <file_name>

```

<br />

### rmdir
* remove directories
  > directory should be **empty**
```s

rmdir <file_name>

# remove directories not empty
## use rmdir
## file name 1 and file name2 are deleted
rmdir -p <file_name1/file_name2>

## use rm
rm -r <file_name>

```

<br />

## [cURL](https://www.scribd.com/document/90229628/Curl-Manual)
* Write output to <file> instead of stdout
```s
    curl -o [Options] <URL>
```

<br />

## why can we use `ls`?
* the complete file name of `ls` (executable file) is `/bin/ls` 
* if there are multiple directories with `ls`, `ls` will be called from the file which is searched the first
* `ls` is an environment variable via `PATH`
* because of linking files, printing the search path by root or non-root is different

### Environment Path
* search path follows a **fixed order** and used `:` to separate variables
* `.` should not be put in the environment path since `.` is not static (we change the current directory to other directory)

  ```s
  # print the search path; $VARIABLE
  echo $PATH # > /usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin

  # Add a new path to the PATH variable => reassign the PATH variable with the new path
  ## at the beginning of the existing PATH variable
  PATH="/root:${PATH}"

  ## at the bottom of the existing PATH variable
  PATH="${PATH}:/root"

  ```

<br />

### `ls`

  ```s
  # print modification time of files
  ls -alF --full-time ~

  # use a long listing format
  ls -l

  ```

<br />

## Copy
* make sure your **role** when using `cp`
  > copy the property of files

  ```s
  # copy files to current directory
  cp <file> .

  # copy files and ask whether to overwrite
  cp -i <file> .

  # copy files with properties to current directory
  ## root: for password files, configs
  cp -a <file> . 
  cp -p <file> . 

  # copy directory to current directory. Properties may be changed
  cp -r <directory> .


  # build a link file to be copied
  ## make symbolic links instead of copying => shortcut
  cp -s <file> <file_link_name>

  ## hard link files instead of copying
  cp -l <file> <file_link_name>

  ```

<br />

## Remove

<br />

## Move

<br />





