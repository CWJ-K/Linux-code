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
