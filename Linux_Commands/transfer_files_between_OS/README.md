<!-- omit in toc -->
# Introduction
How to transfer files across different systems?

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [1. scp](#1-scp)
  - [2. rsync](#2-rsync)
- [Commands](#commands)
  - [1. transfer files between Windows and Linux](#1-transfer-files-between-windows-and-linux)
  - [2. transfer files between Linux/MacOS and Linux](#2-transfer-files-between-linuxmacos-and-linux)
    - [2.1. Note: ignored specific files as files are transferred:](#21-note-ignored-specific-files-as-files-are-transferred)

<br />

# Fundamental Concepts

## 1. scp

## 2. rsync

<br />

# Commands 


<br />


## 1. transfer files between Windows and Linux
scp -r \Users\Desktop\folder root@xxx.xxx.xx.xx:~/folder

<br />

## 2. transfer files between Linux/MacOS and Linux
rsync -a --progress \Users\Desktop\folder root@xxx.xxx.xx.xx:~/folder

<br />

### 2.1. Note: ignored specific files as files are transferred:
--exclude '.git' --exclude '.venv/' 