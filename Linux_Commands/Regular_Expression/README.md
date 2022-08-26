<!-- omit in toc -->
# Introduction

<br />

<!-- omit in toc -->
# Table of Contents

<br />

# Fundamental Concepts
## Regular Expression (RE)
* the regular expression is different from wildcards
* different languages have different RE
  * because of encodings
  * Following POSIX, commands use RE for `LANG=C` in the script


<br />

# Commands 
## RE
|Characters|Meaning|
|:---|:---|
|`[:alnum:]`|0-9, A-Z, a-z|
|`[:alpha:]`|A-Z, a-z|
|`[:blank:]`|space, [Tab]|
|`[:cntrl:]`|keys on computer keyboards, such as `CR`, `LF`, `Tab`, `Del`|
|`[:digit:]`|0-9|
|`[:graph:]`|except for space, [Tab]|
|`[:lower:]`|a-z|
|`[:print:]`|characters can be printed|
|`[:punct:]`|punctuation symbols, such as `" ' ? ! ; : # $`|
|`[:upper:]`|A-Z|
|`[:space:]`|space, [Tab], `CR`|
|`[:xdigit:]`|Hexadecimal System, 0-9, A-F, a-f|

## grep
* [Basic Usage](../shell/README.md#grep)
```bash
    # -A: print columns after the columns with keywords
    # -B: print columns before the columns with keywords
    grep [-A] [-B] [--color=auto] 'keywords' filename

    dmesg | grep -A3 -B2 -n --color=auto  'drm'
    grep -n 'the' regular_express.txt
    grep -vn 'the' regular_express.txt
    grep -in 'the' regular_express.txt
```
### RE
#### a collection of characters
* `[]`: words with any characters in `[]`
* `string`: words with the same character as `string`

```bash
    grep -n 't[ae]st' regular_express.txt
    grep -n 'tes' regular_express.txt 
    grep -n '[^t]est' regular_express.txt 

    # do not select words starting with lower cases
    grep -n '[^a-z]oo' regular_express.txt
    grep -n '[^[:lower:]]oo' regular_express.txt

    # select numbers
    grep -n '[0-9]' regular_express.txt
    grep -n '[[:digit:]]' regular_express.txt
```

#### prefix and suffix
* `^`
  * inside `[]`: reversed selection
  * outside `[]`: select words with a specific prefix
* `$`
  * select words with a specific suffix 
  * sometimes, implies [the last column in the files](README.md#sed)

```bash
	grep -n '^[[:lower:]]' regular_express.txt

  # columns with the last character which is .
	grep -n '\.$' regular_express.txt

	# find some sentences with dots are not selected
	## because of the newline of Windows
	## use cat -A
	cat -An regular_express.txt | head -n 10 | tail -n 6
	
	# find space 
	grep -n '^$' regular_express.txt

	grep -v '^$' /etc/rsyslog.conf | grep -v '^#'

```

#### any characters and repeated characters
* `.`: must have at least any one  character
* `*`: repeat the previous number at least one time
  * `0*`: empty or at least one 0 (optional)
  * `00*`: must have one 0 or at least two 0s (optional)

```bash
  
  grep -n 'g..d' regular_express.txt
  
  # at least 2 0s
  grep -n 'ooo*' regular_express.txt

  # empty or at least one g 
  grep -n 'g*g' regular_express.txt

  # empty or at least any one character => g...g
  grep -n 'g.*g' regular_express.txt
```

#### repeated characters in a range
* `\{number\}`

```bash
  # repeat o two to five times
  grep -n 'go\{2,5\}g' regular_express.txt

  # repeat 0 at least two times
  grep -n 'go\{2,\}g' regular_express.txt
```


## sed
* pipeline commands 
  * can analyze standard inputs
* useful to modify files with too many columns, which is hard to edit in `vim`

```bash
  sed [-nefr] [column_number actions]
  sed [-nefr] [patterns(`/pattern/`) actions]

  # delete data from the second column to the fifth column
  nl <file> | sed '2,5d'


  # append data; use \ for multiple columns
  nl <file> | sed '2a hello \ hi hi \ hey hey'

  # replace data
  nl <file> | sed '19,21c hi'

  # print
  ## -n: silent
  nl <file> | sed -n '19,21p'


  # search and replace
  sed 's/<replaced words>/<new words>/g'
  ## remove words
  /sbin/ifconfig eth0 | grep 'inet ' | sed 's/^.*inet //g' | sed 's/ .*etmask.*$//g'

  # delete columns starting with # and delete empty columns
  cat <file> | sed 's/#.*$//g' | sed '/^$/d'
```

* directly modify files
  ```bash
    # -i: point to the file to be modified instead of STDIN
    sed -i 's/\.$/\!/g' <file>

    # $: the last column
    sed -i '$a # This is a test' regular_express.txt
  ```


## Extended RE
* simplify commands

```bash
  # grep not space columns and comments
  ## Method 1
  grep -v '^$' <file> | grep -v '^#'

  ## Method 2
  ### |: or
  ### egrep is alias of grep -E
  egrep -v '^$|^#' <file>
  grep -E -v '^$|^#' <file>

```
* special characters
  |Characters|Meaning|Example|
  |:---:|:---|:---|
  |`+`|repeat at least one previous character, like `*`, but only available in [Extended and Perl-Compatible Regular Expressions](https://stackoverflow.com/a/10763836)|`'go+d'`: good, god, goood|
  |`?`|repeat none or at least one previous character, like `*`, but only available in [Extended and Perl-Compatible Regular Expressions](https://stackoverflow.com/a/10763836)|`'go?d'`: good, gd, goood|
  |`|`|or||
  |`()`|group|`g(la|oo)d`: good, glad|
  |`()+`|at least one group|`'A(xyz)+C'`: AxyzxyzxyzxyzC|