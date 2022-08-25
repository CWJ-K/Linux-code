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

```bash
	grep -n '^[[:lower:]]' regular_express.txt

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

