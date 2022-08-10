<!-- omit in toc -->
# Introduction
How to use shell?

<br />

<!-- omit in toc -->
# Table of Contents

<br />

# Fundamental Concepts
## what is shell
* an interface to control all applications
* Structure
  ```
  hardware <-> kernel <-> application <-> interface (shell)  <-> user
  ```
* There are many different shells
  * default Shell of Linux: Bourne Again SHell (bash); `/bin/bash`
  * see supported shells in machines
    ```s
    cat etc\shells
    
    ```
* shell of different users
  * when login in machines, a shell will be provided to users
  * see shells of each user
    ```s
    # the last part of each line
    cat etc\passwd
    
    ```

## Advantages of bash
* it can provide the history of commands typed by users
  * stored in `.bash_history`: history of the last logging-in 
  * store current history when logging out machines; if not logging out, the current history is stored in memory
  * disadvantages: hackers may see passwords if it was stored in the history

* autofill keywords
  * autofill commands: tab on the first word in the command line
  * autofill files: tab on the second word in the command line

* alias
  * replace inner commands by customized commands
    ```s
    alias lm='ls -al'
    
    ```
* job control, foreground, background (TODO)
* shell scripts (TODO)
* wildcard

## Environment Variable
* Use `capital` and `$` to imply environment variables
* Can be used for obtaining the results of other outputs, shortcuts of commands

### PS1
* to customized your prompt characters|PS1='[\u@\h \w \A #\#]\$ '
* make your prompt characters with time and other symbols|

### ?
* print the return value of the previous command
  * 0: successful
  * not 0: not successful
* used for debug

```s
  # test a command
  ls -al

  # print the return values
  echo $?

  
```

### $
* PID of the shell
```s
  # first $ is for variable, next $ is PID
  echo $$

```

<br />

# Commands 
## display the source of commands
* search for commands/executable files
```s
    type [-tpa] command
    type -a ls
    type cd 

```

## type long commands
* use `\[Enter]`
  * imply space
  * like `\$`, makes `Enter` is not executable by `\` 

* Sheets
  |Commands|Meaning|
  |:---:|:---|
  |`ctrl` + u; `ctrl` + k|delete the front or back of cursors|
  |`ctrl` + a; `ctrl` + e|the head or tail of commands|


## Environment Variables
```s
  ## Read variables
  echo $PATH
  echo ${PATH}

```
### Assign Value
```s
  # no exiting variables. Default is empty
  echo ${my_variables}

  # Assign values 
  ## can not use space connecting =
  ## the first character of variables can not be number
  ## can use lower cases as a variable name
  my_variables=hi

  ## if spaces are in contents, use '' or "" or \ (Escape Character) e.g. [Enter], $ ... 
  my_variable='hello hi'

  ## use the information provided by other commands by $() or ``

  version=$(uname -r)
  version=`uname -r`

  ## Extend the content of variables by "$VAR" or ${VAR}
  PATH="$PATH":contents 
  PATH=${PATH}:contents

  ## cancel variable
  unset variable

  ## export variables of parent program to subprogram
  export variable


  # Example 1: go to module directory of your kernel
  cd /lib/modules/$(uname -r)/kernel 

  # Example 2: find crontab files and print their detailed information
  ls -ld $(locate crontab)

  # Example 3: shortcut of command directories
  work='/path/to/workspace/'
  cd $work

  # print default variables
  env

  ## Example: default random is from 0 to 32767. if want to limit in the range of 0 to 32768
  declare -i number=$RANDOM*10/32768 ; echo $number

  # print all variables 
  set
```