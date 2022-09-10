<!-- omit in toc -->
# Introduction

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [Shell script](#shell-script)
- [Commands](#commands)
  - [Shell Scripts](#shell-scripts)
  - [How to Execute the Scripts](#how-to-execute-the-scripts)
    - [difference between source, sh script, ./script](#difference-between-source-sh-script-script)
  - [Conventions](#conventions)

<br />

# Fundamental Concepts
## Shell script
* a program was written by shell
* Plain text files
* without compiler and with debug

<br /> 

# Commands 
## Shell Scripts
* `#`: comments to be ignored
  * `#!bin/bash`
    * the fist row starts with `#!`
    * important to declare the script was written by `bash` 
    * load the configures, like `~/.bashrc` of `non-login shell`
* `Enter`: start to execute the command
* `\Enter`: commands extend to the next row
* [`export PATH`](https://askubuntu.com/questions/720678/what-does-export-path-somethingpath-mean)
  * 


## How to Execute the Scripts
* when executing the script, a **new bash** will be activated
  * variables in the children process, scripts, will not be exported to parent processes
* Commands
  * shell must can be read and executed (rx)
  1.  absolute path: `the_directory/script.sh`
  2.  relative path: in the directory of the script, `./script.sh`
  3.  PATH: add the script into the environment, such as `~/bin/`
* Bash
  1. `bash script.sh`
  2. `sh script.sh` 
    * `/bin/sh` is the linked files of `/bin/bash` 

### difference between source, sh script, ./script
* `source`
  * use parent processed to execute scripts
    * do not need to export variables
    ```bash
      source <file>.sh

      # can activate scripts without logout and login
      source ~/.bashrc
    ```

## Conventions
* Essential contents
  1. contents and functions
  2. version information
  3. author and contact information
  4. start date of the script
  5. history
* set import environment variables
  * LANG
  * PATH
    * So we do not need to execute the file using absolute path
* return results
  * `exit`: stop the system and return the number to the systems
    * like `echo $?`
    * if succeed, `exit` return 0
    * `exit n`: n can be customized by users
* use `vim` instead of `vi`
  * `vim` provides debug

