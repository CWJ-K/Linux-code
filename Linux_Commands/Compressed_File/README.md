<!-- omit in toc -->
# Introduction

<br />

<!-- omit in toc -->
# Table of Contents

<br />

# Fundamental Concepts

## File Extensions in Linux
* file extensions only show the commands related to the files
* table of compressed file extensions
  |File Extension|Meaning|Note|
  |:---:|:---|:---|
  |*.Z      |Use compress to compress files| out of fashion |
  |*.zip    |Use zip to compress files|   | 
  |*.gz     |Use gzip to compress files| widely used, replace compress. Time of compression is the least| 
  |*.bz2    |Use bzip2 to compress files| to replace gzip for better compression |
  |*.xz     |Use xz to compress files| better than gzip and bzip2. Time of compression is the most  |
  |*.tar    |Use tar to package files, not to compress|   | 
  |*.tar.gz |Use tar to package files and use gzip to compress files|   | 
  |*.tar.bz2|Use tar to package files and use bzip2 to compress files|   |
  |*.tar.xz |Use tar to package files and use xz to compress files|   |

<br />

# Commands 
## read compressed files
```s
  zcat
  zmore
  zless 

```

<br />

## gzip
* default: after using gzip, the original files will be replaced with *.gz

```s
  gzip [-cdtv#] <file>

  # see the contents of gz
  zcat <file>.gz

  # decompression: replace *.gz with original files
  gzip -d services.gz

  # compress files and keep original files; default -6
  gzip -9 -c -v <file> > <file>.gz

  # fine keywords in gz files
  zgrep -n 'word' <file>.gz

```

<br />

## bzip2
* commands are same as `gzip`
* better than `zgip`
  
```s
  bzip2 [-cdkzv#] <file>
  bzcat <file>.bz2

```

<br />

## xz
* commands are same as `gzip`
  
```s
  xz [-dtlkc#] <file>
  xcat <file>.xz

```

<br />

## tar
* `gzip`, `bzip2`, `xz` separately **compress** files under the directories 
* **package** the whole files or directories into one file, like `WinRAR`
  > package vs compress
* package files into devices, like tape, which can not use `cp` files
* Terminology
  * tarfile `tar -cv -f file.tar`: packaged files, but not decompression
  * tarball `tar -jcv -f file.tar.bz2 `: packaged and decompressed files

### package files
  ```s
  # package files
  tar -jcv -f <filename>.tar.bz2
  
  ```

#### package and backup files

  ```s
  # to backup specific files requires permission: su
  # time records the execution time

  # -z: gzip
  time tar -zpcv -f /path/filename.tar.gz /<path_of_source_file>

  # -j: bzip2
  time tar -jpcv -f /root/filename.tar.bz2 /etc

  # -J: xz
  time tar -Jpcv -f /root/filename.tar.xz  /etc

  ```

  * `-f`: for file name. Separating it from other options to avoid the change of order   
  * pay attention to below warning.
    ```s
      tar: Removing leading `/' from member names
    ```
    * removing `/` (root) for safety
      * filename with `/` becomes the absolute path, which decompressed files will cover the original path in the absolute path

#### backup files based on modification time
```s
  # package files which modification time earlier than '2015/06/17'
  tar -jcv -f /root/etc.newer.then.passwd.tar.bz2 --newer-mtime="2015/06/17" /etc/*

```


### check for the contents of packaged files
  ```s
    tar -jtv -f <filename>.tar.bz2
  ```


### decompression
* decompress the whole files
  ```s
    tar -jxv -f <filename>.tar.bz2 -C /to_target_path
  ```
* decompress a single file
  ```s
    # find target files
    tar -jtv -f /root/<filename>.tar.bz2 | grep 'keywords'

    # decompress
    tar -jxv -f /root/<filename_after decompression>.tar.bz2 <path>/<target_file_to_be_decompressed>
  
  ```
* decompress a directory without specific files
  ```s
    # package /etc and /root without /root/etc* and /root/system.tar.bz2
    tar -jcv -f /root/system.tar.bz2 --exclude=/root/etc* --exclude=/root/system.tar.bz2 /etc /root
  
  ```
* with pipelines to compress and decompress files
  ```s
  # compress files from /etc and decompress files in /tmp
  cd /tmp
  tar -cvf - /etc | tar -xvf -
  
  ```