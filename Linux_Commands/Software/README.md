<!-- omit in toc -->
# Introduction

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [Executable files](#executable-files)
  - [make](#make)
- [Commands](#commands)
  - [makefile](#makefile)
    - [format](#format)
  - [check the dynamic libraries of binary files](#check-the-dynamic-libraries-of-binary-files)


<br />

# Fundamental Concepts
## Executable files
* **binary** files can be executed
  * use `file`
    * ELF 64-bit LSB executable: binary files can be executed
    * ASCII text executable: a general script
## make
* Benefit:
  * simplify codes to be executed
  * only modify the script to be modified and other object files will not be changed
  * according to the dependency to update executable files


<br />

# Commands

## makefile

### format
* the line of commands should start from <tab>
* `#`: comments
* environment variables can be directly used in `makefile`
  * the order of reading variables
    1. the command of `make` with environment variables
    2. environment variables in the makefile
    3. environment variables of shell
* `$@`: current target

```bash
  VAR = variable

  target: object_file1 object_file2
  <tab> commands $@ ${VAR}  # $@: target

```

```bash
  vim makefile
  make <target>
  make <target1> <target2> # execute target1 first and then target2  

```


## check the dynamic libraries of binary files

```bash
  ldd [-vdr] [filename]

```