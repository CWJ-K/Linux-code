<!-- omit in toc -->
# Introduction
How to use shell?

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [1. what is shell](#1-what-is-shell)
  - [2. Advantages of bash](#2-advantages-of-bash)
  - [3. PS1](#3-ps1)
  - [4. Environment Variable](#4-environment-variable)
    - [4.1. ?](#41-)
    - [4.2. $](#42-)
- [Commands](#commands)
  - [1. display the source of commands](#1-display-the-source-of-commands)
  - [2. type long commands](#2-type-long-commands)
  - [3. Environment Variables - command line](#3-environment-variables---command-line)
    - [3.1. Read variables](#31-read-variables)
    - [3.2. Assign Value](#32-assign-value)
    - [3.3. cancel variable](#33-cancel-variable)
    - [3.4. export variables of parent program to child processes](#34-export-variables-of-parent-program-to-child-processes)
    - [3.5. Examples](#35-examples)
    - [3.6. print default variables](#36-print-default-variables)
    - [3.7. print all variables](#37-print-all-variables)
  - [4. Environment Variables - interactive surface](#4-environment-variables---interactive-surface)
    - [4.1. Read](#41-read)
  - [5. locale](#5-locale)
  - [6. Declare types of variables](#6-declare-types-of-variables)
  - [7. limit users' resources](#7-limit-users-resources)
  - [8. Remove Contents in Variables](#8-remove-contents-in-variables)
    - [8.1. delete from the left => short](#81-delete-from-the-left--short)
    - [8.2. delete from the left => long](#82-delete-from-the-left--long)
    - [8.3. delete from the right => short](#83-delete-from-the-right--short)
    - [8.4. delete from the right => long](#84-delete-from-the-right--long)
    - [8.5. select only the file name](#85-select-only-the-file-name)
    - [8.6. select without the file name](#86-select-without-the-file-name)
  - [9. Replace](#9-replace)
  - [10. Switch](#10-switch)
    - [10.1. Example](#101-example)
  - [11. alias, unalias => for commands](#11-alias-unalias--for-commands)
  - [12. History](#12-history)
  - [13. search order of commands and paths](#13-search-order-of-commands-and-paths)
  - [14. Messages of entering bash](#14-messages-of-entering-bash)
  - [15. Permanently keep configures](#15-permanently-keep-configures)
    - [15.1. login shell](#151-login-shell)
      - [15.1.1. /etc/profile](#1511-etcprofile)
      - [15.1.2. ~/.bash_profile](#1512-bash_profile)
    - [15.2. source](#152-source)
    - [15.3. non-login shell](#153-non-login-shell)
      - [15.3.1. ~/.bashrc](#1531-bashrc)
    - [15.4. Other configuration files](#154-other-configuration-files)
  - [16. Configurations of terminal](#16-configurations-of-terminal)
    - [16.1. stty](#161-stty)
    - [16.2. set](#162-set)
    - [16.3. Useful terminal commands](#163-useful-terminal-commands)
  - [17. wildcard](#17-wildcard)
  - [18. Special symbols](#18-special-symbols)
  - [19. redirect](#19-redirect)
    - [19.1. STDOUT](#191-stdout)
    - [19.2. STDIN](#192-stdin)
  - [20. execute commands once instead of separation](#20-execute-commands-once-instead-of-separation)
    - [20.1. commands are independent](#201-commands-are-independent)
    - [20.2. commands are dependent](#202-commands-are-dependent)
      - [20.2.1. &&](#2021-)
      - [20.2.2. ||](#2022-)
  - [21. last](#21-last)
  - [22. Pipe](#22-pipe)
    - [22.1. capture data](#221-capture-data)
      - [22.1.1. cut](#2211-cut)
      - [22.1.2. grep](#2212-grep)
    - [22.2. order data](#222-order-data)
      - [22.2.1. sort](#2221-sort)
      - [22.2.2. uniq](#2222-uniq)
    - [22.3. wc](#223-wc)
    - [22.4. tee](#224-tee)
    - [22.5. Process Character](#225-process-character)
      - [22.5.1. tr](#2251-tr)
      - [22.5.2. col](#2252-col)
      - [22.5.3. join](#2253-join)
      - [22.5.4. paste](#2254-paste)
      - [22.5.5. expand/unexpand](#2255-expandunexpand)
    - [22.6. split](#226-split)
    - [22.7. xargs](#227-xargs)
    - [22.8. -](#228--)

<br />

# Fundamental Concepts

## 1. what is shell
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

## 2. Advantages of bash
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

## 3. PS1
* not environment variables
* to customized your prompt characters|PS1='[\u@\h \w \A #\#]\$ '
* make your prompt characters with time and other symbols|

## 4. Environment Variable
* Use `capital` and `$` to imply environment variables
* Can be used for obtaining the results of other outputs, shortcuts of commands



### 4.1. ?
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

### 4.2. $
* PID of the shell
```s
  # first $ is for variable, next $ is PID
  echo $$

```


<br />

# Commands 

## 1. display the source of commands
* search for commands/executable files
```s
    type [-tpa] command
    type -a ls
    type cd 

```

## 2. type long commands
* use `\[Enter]`
  * imply space
  * like `\$`, makes `Enter` is not executable by `\` 

* Sheets
  |Commands|Meaning|
  |:---:|:---|
  |`ctrl` + u; `ctrl` + k|delete the front or back of cursors|
  |`ctrl` + a; `ctrl` + e|the head or tail of commands|


## 3. Environment Variables - command line

### 3.1. Read variables
```s
  echo $PATH
  echo ${PATH}

```

### 3.2. Assign Value
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

### 3.3. cancel variable
  ```s
    unset variable
  ```

### 3.4. export variables of parent program to child processes
* child processes only inherit the environment variables from parent processes 
  * other variables can not be passed to child processes
* mark variables and functions to be passed to child processes

  ```s
  export variable

  # without variables, export all variables
  export
  ```

### 3.5. Examples
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

### 3.6. print default variables
  ```s
    env
  ```

### 3.7. print all variables 
  ```s
    set
  ```

## 4. Environment Variables - interactive surface

### 4.1. Read
* assign variables

```s
 read [-pt] <variable>
 # write the content of the variable

 echo $<variable>

 read -p "Please key in your name: " -t 30 named

```

## 5. locale
* set `LANG` or `LC_ALL` to change all languages
  * can combine with `export` for temporary usage
* change `cat /etc/locale.conf` for specific languages
```s
  # see supported languages
  locale  

```

## 6. Declare types of variables
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

## 7. limit users' resources
* `0` means unlimited
* if want to recover ulimit
  * login and logout
  * if not logout, `unlimit` only decreases limits and can not increase limits
```s
  ulimit [-SHacdfltu] [number]

  # print the limit of the current role
  ulimit -a

```

## 8. Remove Contents in Variables
* `echo` for calling variable names

### 8.1. delete from the left => short
* `${variable#/path_to_be_deleted:}`

```shell
  echo ${path#/*local/bin:}
```

### 8.2. delete from the left => long
* `${variable##/path_to_be_deleted:}`

```shell
  echo ${path##/*:}
```

### 8.3. delete from the right => short
* `${variable%:path_to_be_deleted}`
  * `:` until

```shell
  echo ${path%:*bin}

```

### 8.4. delete from the right => long
* `${variable%%:path_to_be_deleted}`
  * `:` until

```shell
  echo ${path%%:*bin}

```

### 8.5. select only the file name
```shell
  # variable: MAIL
  # e.g. /var/spool/mail/dmtsai  => dmtsai
  echo ${MAIL##/*/}

```

### 8.6. select without the file name
```shell
  # variable: MAIL
  # e.g. /var/spool/mail/dmtsai  => /var/spool/mail/
  echo ${MAIL%/*}
```

## 9. Replace
* the first one with the same pattern will be replaced
  * ${variable/string_to_be_replaced/strings_to_replace}
* all with the same pattern will be replaced
  * ${variable//string_to_be_replaced/strings_to_replace}


```shell
  echo ${path/sbin/SBIN}

```

## 10. Switch
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

### 10.1. Example
```shell
  # see var and str; if str does not exist
  unset str; var=${str-newvar}
  echo "var=${var}, str=${str}" # var = newvar, str= 
```
* if the variable does not exist, display messages
* `?`

```shell
  # display none if str does not exist
  unset str; var=${str?None}

```

## 11. alias, unalias => for commands
* advantages
  * shortcut of long commands
  * replace original commands
* `name='commands'`

```shell
  alias lm='ls -al | more'
  alias rm='rm -i'

  # display current alias
  alias 

  # cancel alias
  unalias lm

```

## 12. History
* see history of commands used by users
* store history in `~/.bash_history `
  * only store the maximum number: `echo ${HISTSIZE}` => 1000
  * if more than 1000, old history will be removed

```shell
  history

  # use commands in history according to the number
  !<number>

  # execute the last command
  !!

  # execute the last command starting with al
  ## !command
  !al

```

## 13. search order of commands and paths
* There are different ways to set commands. How to know which way is read first?

```shell
  # type -a <command>
  type -a ls
  ## the first command to be searched for is on the top

```

## 14. Messages of entering bash
* modified messages of machines in `/etc/issue`
* `/etc/issue.net` for telnet (remotely login)
* give messages to every users
  * e.g. for maintenance time
  * `vim /etc/motd`


```shell
  # see current messages
  cat /etc/issue
  
  # see commands can used in /etc/issue
  man agetty # ISSUE ESCAPES

  ## e.g. 
  ### \d: current date
```

## 15. Permanently keep configures
* default: custom configures will be removed when logging out bash
* `login shell` vs `non-login shell`
  * the difference is in whether to log in to the shell
  * login shell: require passwords to log in
  * non-login shell: already log in to the shell but use other terminals to enter bash without passwords
  * They used different configures to read configures

### 15.1. login shell
* read configures from only below two files:
  1. `/etc/profile`: the global setting => do not modify it
  2. `~/.bash_profile`, `~/.bash_login`, `~/.profile`: users' setting => modify this one

#### 15.1.1. /etc/profile
* use `UID` to identify users' settings => must be read by users logging in shell
* read other configure files in the following order
  1. `/etc/profile.d/*.sh`: include the color of bash, commands of `ls`, `ll`, `vi`, `which`
  2. `/etc/locale.conf`: called by `/etc/profile.d/lang.sh`. Include the setting of languages
  3. `/usr/share/bash-completion/completions/*`: called by `/etc/profile.d/bash_completion.sh`

#### 15.1.2. ~/.bash_profile
* after reading `/etc/profile`, read `~/.bash_profile` for users' configuration files
* only read one of below configuration files in the following order. If one exists, the others will not be read
  1. ~/.bash_profile
  2. ~/.bash_login
  3. ~/.profile

### 15.2. source
* two methods to read configuration files
  1. login shell
  2. use `source` or `.`

```bash
  # source configuration_files
  source ~/.bashrc
  
  . ~/.bashrc
```

### 15.3. non-login shell
* when non-login shell, it will only read `~/.bashrc`

#### 15.3.1. ~/.bashrc
* will call `/etc/bashrc` 及 `/etc/profile.d/*.sh`
  > if you find the command line becomes `-bash-4.2$`, it implies `~/.bashrc` disappears. Solution:
  1. copy `/etc/skel/.bashrc` to the home directory
  2. source ~/.bashrc

### 15.4. Other configuration files
* `/etc/man_db.conf`: includes the path of `man`
  * if you can not use man, it may be `man` stored in different directories. Add the path of `man` to `/etc/man_db.conf` 

* `~/.bash_history`: commands of `history`
* `~/.bash_logout`: when logging out, actions will be taken before exiting shells

## 16. Configurations of terminal
* e.g. use `back` or `delete` to delete command lines

### 16.1. stty
* configurations of setting tty (terminal)
```bash
  # display all terminal commands
  ## ^: ctrl
  stty -a

  # set erase as other terminal commands
  stty erase ^h
```

### 16.2. set
* configurations of bash
```bash
  # display all configurations
  set

  # set 

```

### 16.3. Useful terminal commands
* delete current command lines: `ctrl+u` or `ctrl+?`


## 17. wildcard
|Symbol|Meaning|
|:---:|:---:|
|`*`|any characters|
|`?`|must be one character|
|`[]`|must have characters in brackets|
|`[-]`|must have characters in the range of letters or number|
|`[^]`|not characters in brackets|

```bash
  # only 5 characters
  ll -d /etc/?????

  ll -d /etc/*[0-9]* 
  ll -d /etc/[^a-z]*
```

## 18. Special symbols 
|Symbol|Meaning|
|:---:|:---:|
|`#`|comment|
|`\`|escape characters to make special characters and wildcards as pure characters|
|`|`|pipe; return results to other pipes|
|`;`|separate commands|
|`~`|home directory|
|`$`|to represent variables|
|`&`|job control;  ??|
|`!`|not|
|`/`|division of path|
|`>`, `>>`|output|
|`<`, `<<`|input|
|`''`|can not keep `$` as variables|
|`""`|can keep `$` as variables|
|`` ``|can point to commands|
|`()`|the beginning and ending of child processes|
|`{ }`|the combination of commands|


## 19. redirect
* the result of one command is redirected to other commands
* standard output (STDOUT)
* standard error output (STDERR)
* common usage
  * use commands to avoid error messages stopping current processes
  * store logs 
  * separate correct and wrong messages

### 19.1. STDOUT
|Type|Symbol|Meaning|
|:---:|:---:|:---:|
|stdin (0)|`>`, `>>`|output. `>` overwrites existing data; `>>` appends existing data|
|STDOUT (1)|`1>`, `1>>`|transfer correct data|
|STDERR (2)|`2>`, `2>>`|transfer wrong data|


```bash
  # create a new file and type words in the file
  cat > file

  # store correct and wrong outputs to different files
  find /home -name .bashrc > list_right 2> list_error

  # do not store and print wrong outputs => store in /dev/null
  find /home -name .bashrc 2> /dev/null

  # store correct and wrong outputs in the same file
  ## 2>&1: redirect 2 to 1 
  ## &>: all 2 and 1
  find /home -name .bashrc > list 2>&1
  find /home -name .bashrc &> list

  # combine all files into one file
  cat services* >> servicesback

```

### 19.2. STDIN
* the **content** of files is redirected 

|Symbol|Meaning|
|:---:|:---:|
|`<`|need `ctrl+d` to exit|
|`<<`|use customized characters to exit, instead of `ctrl+d`|

```bash
  # store the content of files into new files
  ## like cp
  cat > catfile < ~/.bashrc

  ## type eof in the end to exit files
  cat > catfile << "eof"

```

## 20. execute commands once instead of separation

### 20.1. commands are independent
* `;`
* all commands are independent
```bash
  # cmd;cmd
  sync; sync; shutdown -h now

```

### 20.2. commands are dependent
* use `$?` to return values(0: success; 1: nonsuccess

#### 20.2.1. &&
* if the previous command **succeeds**, **start** to process the next command
* if the previous command does **not succeed**, do **not start** to process the next command

#### 20.2.2. ||
* if the previous command **succeeds**, do **not start** to process the next command
* if the previous command does **not succeed**, **start** to process the next command


```bash 
  # if files exist, start to touch files
  ls /tmp/test && touch /tmp/test/hi
  # make files if files do not exist
  ls /tmp/test || mkdir /tmp/test


  # from left to right !!
  ## check if the file exist, if not create the file, and then touch the file
  ls /tmp/test || mkdir /tmp/test && touch /tmp/test/hi
```

## 21. last 
* Display the information of user

```bash
  last

```

## 22. Pipe
* input data is passed through in pipelines
  * only `standard output` can be input data

### 22.1. capture data

#### 22.1.1. cut
* from only **one** command line, obtain the desired part
* not efficient to process data with several spaces => use `awk`

```bash
  
  # -d: delimiter
  # -f: fields (= positions, starting from 1) based on the words separated by delimiters
  echo ${PATH} | cut -d ':' -f 3,5

  # select characters after the 12th position
  export | cut -c 12-

```

#### 22.1.2. grep
* find patterns in one command line
* [advanced usage](../Regular_Expression/README.md#grep)
```bash
  grep [-acinv] [--color=auto] '<patterns>' <filename>

  last | grep '<words>'

  # -v reverse: select without specific patterns
  last | grep -v '<words>'
```

### 22.2. order data

#### 22.2.1. sort

```bash
  sort [-fbMnrtuk] [file or stdin]

  # -t: delimiter
  # -k: sort based on the field
  cat /etc/passwd | sort -t ':' -k 3 | tail -n 5

  # -n: see string as number to do sort
  cat /etc/passwd | sort -t ':' -k 3,3 -n | tail -n 5
```

#### 22.2.2. uniq
* display unique information from duplicated data
```bash
  # -c count
  # -i: ignore case sensitivity
  uniq [-ic]

  last | cut -d ' ' -f1 | sort | uniq -c

```


### 22.3. wc
* display word counts

```bash
  wc [-lwm] <file_name>
  # output: number of columns, words, characters

  cat <file> | wc
```

### 22.4. tee
* reads the standard input and writes it to both the standard output and one or more files

```bash
  last | tee last.list | cut -d " " -f1

```

### 22.5. Process Character

#### 22.5.1. tr
* delete characters or replace charters with other characters
* can combine with regular expression

```bash
  # -d: delete
  # -s: replace
  tr [-ds] <characters>

  # replace small letters with capitals
  last | tr '[a-z]' '[A-Z]'

  # remove :
  cat /etc/passwd | tail -n 5 | tr -d : # or ':'

```

#### 22.5.2. col
* replace `[tab]` with `[space]`

```bash
  col [-xb]

  # displace all special characters
  cat -A <file>

  cat <file> | col -x | cat -A | more

```

#### 22.5.3. join
* join files 
```bash
  join [-ti12] file1 file2
  # -t: delimiters
  join -t ':' /etc/passwd /etc/shadow | head -n 3

  # -1: the first file use the position to join
  # -2: the second file use the position to join
  join -t ':' -1 4 /etc/passwd -2 3 /etc/group | head -n 3

```

#### 22.5.4. paste
* combine two files with `tab` to separate them

```bash
  # -d: delimiter. default = tab
  # -: means the data of standard input
  paste [-d] <file> <file>

  # -: /etc/group
  cat /etc/group|paste /etc/passwd /etc/shadow -|head -n 3

```


#### 22.5.5. expand/unexpand
* use on files with the `tab` or `space` delimiters
* transfer `tab` to `space` and can adjust the width of `space`
* transfer `space` to `tab`
  
```bash
  expand [-t] file

  cat /etc/passwd | head -n 3 | expand -t 6 - | cat -A

```

### 22.6. split

```bash
  split [-bl] <file> <PREFIX>

  ls -al / | split -l 10 - lsroot

```

### 22.7. xargs
* generate arguments for commands
  * read stdin data as arguments
* reasons to use `xargs` are some commands do not support `pipeline commands` 
```bash
  xargs [-0epn] command

  # -n: one argument one time
  cut -d ':' -f 1 /etc/passwd | head -n 3 | xargs -n 1 id

  # until the word 'sync'
  cut -d ':' -f 1 /etc/passwd | xargs -e'sync' -n 1 id

  # find files with special permission by two methods
  find /usr/sbin -perm /7000 | xargs ls -l
  ls -l $(find /usr/sbin -perm /7000)
```

### 22.8. -
* can replace `stdin` and `stdout` without using filenames

```bash
  # -: stdin, content of home ; -: use stdout
  tar -cvf - /home | tar -xvf - -C /tmp/homeback

```