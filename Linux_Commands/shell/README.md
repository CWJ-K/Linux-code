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

## PS1
* not environment variables
* to customized your prompt characters|PS1='[\u@\h \w \A #\#]\$ '
* make your prompt characters with time and other symbols|

## Environment Variable
* Use `capital` and `$` to imply environment variables
* Can be used for obtaining the results of other outputs, shortcuts of commands



### ?
* print the return value of the previous command
  * 0: successful
  * not 0: not successful
* used for debugging

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


## Environment Variables - command line
### Read variables
```s
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
``` 
### cancel variable
  ```s
    unset variable
  ```
### export variables of parent program to child processes
* child processes only inherit the environment variables from parent processes 
  * other variables can not be passed to child processes
* mark variables and functions to be passed to child processes

  ```s
  export variable

  # without variables, export all variables
  export
  ```

### Examples
  ``` s
  # 1. go to module directory of your kernel
  cd /lib/modules/$(uname -r)/kernel 

  # 2. find crontab files and print their detailed information
  ls -ld $(locate crontab)

  # 3. shortcut of command directories
  work='/path/to/workspace/'
  cd $work
  
  ## 4. default random is from 0 to 32767. if want to limit in the range of 0 to 32768
  declare -i number=$RANDOM*10/32768 ; echo $number

  # print all variables 
  set
  ```

### print default variables
  ```s
    env
  ```

### print all variables 
  ```s
    set
  ```

## Environment Variables - interactive surface
### Read
* assign variables

```s
 read [-pt] <variable>
 # write the content of the variable

 echo $<variable>

 read -p "Please key in your name: " -t 30 named

```

## locale
* set `LANG` or `LC_ALL` to change all languages
  * can combine with `export` for temporary usage
* change `cat /etc/locale.conf` for specific languages
```s
  # see supported languages
  locale  

```

## Declare types of variables
* default type is `string`
```s
  declare [-aixr] variable
  # a: array
  # i: integer => no float
  # x: export variables
  # r: read-only => can not unset and modified; only logout can revise

  # declare variables as integer
  declare -i sum=100+300+50

  # + cancel export
  declare +x variable

  # print type of a variable
  declare -p variable

  ## array
  var[1]="small min"
  var[2]="big min"
  var[3]="nice min"
  echo "${var[1]}, ${var[2]}, ${var[3]}"
```

## limit users' resources
* `0` means unlimited
* if want to recover ulimit
  * login and logout
  * if not logout, `unlimit` only decreases limits and can not increase limits
```s
  ulimit [-SHacdfltu] [number]

  # print the limit of the current role
  ulimit -a

```

## Remove Contents in Variables

### delete from the left => short
* `${variable#/path_to_be_deleted:}`

```shell
  echo ${path#/*local/bin:}
```

### delete from the left => long
* `${variable##/path_to_be_deleted:}`

```shell
  echo ${path##/*:}
```

### delete from the right => short
* `${variable%:path_to_be_deleted}`
  * `:` until

```shell
  echo ${path%:*bin}

```

### delete from the right => long
* `${variable%%:path_to_be_deleted}`
  * `:` until

```shell
  echo ${path%%:*bin}

```

### select only the file name
```shell
  # variable: MAIL
  # e.g. /var/spool/mail/dmtsai  => dmtsai
  echo ${MAIL##/*/}

```

### select without the file name
```shell
  # variable: MAIL
  # e.g. /var/spool/mail/dmtsai  => /var/spool/mail/
  echo ${MAIL%/*}
```

## Replace
* the first one with the same pattern will be replaced
  * ${variable/string_to_be_replaced/strings_to_replace}
* all with the same pattern will be replaced
  * ${variable//string_to_be_replaced/strings_to_replace}


```shell
  echo ${path/sbin/SBIN}

```

## Switch
* if variables exist, use original contents
  * if not use new content
  * if variables are `empty string`, new content will not be used
* `-`: new content
```shell
  # username does not exist, root will be used as the new content
  username=${username-root} # username = root

  # username exists, the content is the original one 
  username="hello"
  username=${username-root} # username = hello

```

* if variables are `empty string`, new content will replace the empty string
* `:`

```shell
  # assign empty string
  username=""
  username=${username-root} # username = ""
  username=${username:-root} # username = root

```

### Example
```shell
  # see var and str
  unset str; var=${str-newvar}
  echo "var=${var}, str=${str}"
```