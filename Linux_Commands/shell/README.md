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
* `echo` for calling variable names

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

## alias, unalias => for commands
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

## History
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

## search order of commands and paths
* There are different ways to set commands. How to know which way is read first?

```shell
  # type -a <command>
  type -a ls
  ## the first command to be searched for is on the top

```

## Messages of entering bash
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

## Permanently keep configures
* default: custom configures will be removed when logging out bash
* `login shell` vs `non-login shell`
  * the difference is in whether to log in to the shell
  * login shell: require passwords to log in
  * non-login shell: already log in to the shell but use other terminals to enter bash without passwords
  * They used different configures to read configures
### login shell
* read configures from only below two files:
  1. `/etc/profile`: the global setting => do not modify it
  2. `~/.bash_profile`, `~/.bash_login`, `~/.profile`: users' setting => modify this one

#### /etc/profile
* use `UID` to identify users' settings => must be read by users logging in shell
* read other configure files in the following order
  1. `/etc/profile.d/*.sh`: include the color of bash, commands of `ls`, `ll`, `vi`, `which`
  2. `/etc/locale.conf`: called by `/etc/profile.d/lang.sh`. Include the setting of languages
  3. `/usr/share/bash-completion/completions/*`: called by `/etc/profile.d/bash_completion.sh`

#### ~/.bash_profile
* after reading `/etc/profile`, read `~/.bash_profile` for users' configuration files
* only read one of below configuration files in the following order. If one exists, the others will not be read
  1. ~/.bash_profile
  2. ~/.bash_login
  3. ~/.profile

### source
* two methods to read configuration files
  1. login shell
  2. use `source` or `.`

```bash
  # source configuration_files
  source ~/.bashrc
  
  . ~/.bashrc
```

### non-login shell
* when non-login shell, it will only read `~/.bashrc`
#### ~/.bashrc
* will call `/etc/bashrc` 及 `/etc/profile.d/*.sh`
  > if you find the command line becomes `-bash-4.2$`, it implies `~/.bashrc` disappears. Solution:
  1. copy `/etc/skel/.bashrc` to the home directory
  2. source ~/.bashrc

### Other configuration files
* `/etc/man_db.conf`: includes the path of `man`
  * if you can not use man, it may be `man` stored in different directories. Add the path of `man` to `/etc/man_db.conf` 

* `~/.bash_history`: commands of `history`
* `~/.bash_logout`: when logging out, actions will be taken before exiting shells

## Configurations of terminal
* e.g. use `back` or `delete` to delete command lines
### stty
* configurations of setting tty (terminal)
```bash
  # display all terminal commands
  ## ^: ctrl
  stty -a

  # set erase as other terminal commands
  stty erase ^h
```
### set
* configurations of bash
```bash
  # display all configurations
  set

  # set 

```
### Useful terminal commands
* delete current command lines: `ctrl+u` or `ctrl+?`


## wildcard
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

## Special symbols 
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


## redirect
* the result of one command is redirected to other commands
* standard output (STDOUT)
* standard error output (STDERR)
* common usage
  * use commands to avoid error messages stopping current processes
  * store logs 
  * separate correct and wrong messages

### STDOUT
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
### STDIN
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

## execute commands once instead of separation
### commands are independent
* `;`
* all commands are independent
```bash
  # cmd;cmd
  sync; sync; shutdown -h now

```
### commands are dependent
* use `$?` to return values(0: success; 1: nonsuccess
#### &&
* if the previous command **succeeds**, **start** to process the next command
* if the previous command does **not succeed**, do **not start** to process the next command
#### ||
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

## last 
* Display the information of user

```bash
  last

```

## Pipe
* input data is passed through in pipelines
  * only `standard output` can be input data

### capture data
#### cut
* from only **one** command line, obtain the desired part
* not efficient to process data with several spaces => use `awk`

```bash
  
  # -d: delimiter
  # -f: fields (= positions, starting from 1) based on the words separated by delimiters
  echo ${PATH} | cut -d ':' -f 3,5

  # select characters after the 12th position
  export | cut -c 12-

```
#### grep
* find patterns in one command line
```bash
  grep [-acinv] [--color=auto] '<patterns>' <filename>

  last | grep '<words>'

  # -v reverse: select without specific patterns
  last | grep -v '<words>'
```

### order data
#### sort

```bash
  sort [-fbMnrtuk] [file or stdin]

  # -t: delimiter
  # -k: sort based on the field
  cat /etc/passwd | sort -t ':' -k 3 | tail -n 5

  # -n: see string as number to do sort
  cat /etc/passwd | sort -t ':' -k 3,3 -n | tail -n 5
```

#### uniq
* display unique information from duplicated data
```bash
  # -c count
  # -i: ignore case sensitivity
  uniq [-ic]

  last | cut -d ' ' -f1 | sort | uniq -c

```


### wc
* display word counts

```bash
  wc [-lwm] <file_name>
  # output: number of columns, words, characters

  cat <file> | wc
```

### tee
* reads the standard input and writes it to both the standard output and one or more files

```bash
  last | tee last.list | cut -d " " -f1

```

### Process Character
#### tr
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

#### col
* replace `[tab]` with `[space]`

```bash
  col [-xb]

  # displace all special characters
  cat -A <file>

  cat <file> | col -x | cat -A | more

```

#### join
* join files 
```bash
  join [-ti12] file1 file2
  # -t: delimiters
  join -t ':' /etc/passwd /etc/shadow | head -n 3

  # -1: the first file use the position to join
  # -2: the second file use the position to join
  join -t ':' -1 4 /etc/passwd -2 3 /etc/group | head -n 3

```

#### paste
* combine two files with `tab` to separate them

```bash
  # -d: delimiter. default = tab
  # -: means the data of standard input
  paste [-d] <file> <file>

  # -: /etc/group
  cat /etc/group|paste /etc/passwd /etc/shadow -|head -n 3

```


#### expand/unexpand
* use on files with the `tab` or `space` delimiters
* transfer `tab` to `space` and can adjust the width of `space`
* transfer `space` to `tab`
  
```bash
  expand [-t] file

  cat /etc/passwd | head -n 3 | expand -t 6 - | cat -A

```

### split

```bash
  split [-bl] <file> <PREFIX>

  ls -al / | split -l 10 - lsroot

```

### xargs
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

### -
* can replace `stdin` and `stdout` without using filenames

```bash
  # -: stdin, content of home ; -: use stdout
  tar -cvf - /home | tar -xvf - -C /tmp/homeback

```