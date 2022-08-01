<!-- omit in toc -->
# Introduction

<br />

<!-- omit in toc -->
# Table of Contents

<br />

# Fundamental Concepts

## File Extensions in Linux
* file extensions only show the commands related to the files
* table of compressed file extensions
  |File Extension|Meaning|Note|
  |:---:|:---|:---|
  |*.Z      |Use compress to compress files| out of fashion |
  |*.zip    |Use zip to compress files|   | 
  |*.gz     |Use gzip to compress files| widely used, replace compress. Time of compression is the least| 
  |*.bz2    |Use bzip2 to compress files| to replace gzip for better compression |
  |*.xz     |Use xz to compress files| better than gzip and bzip2. Time of compression is the most  |
  |*.tar    |Use tar to package files, not to compress|   | 
  |*.tar.gz |Use tar to package files and use gzip to compress files|   | 
  |*.tar.bz2|Use tar to package files and use bzip2 to compress files|   |
  |*.tar.xz |Use tar to package files and use xz to compress files|   |

<br />

# Commands 
## read compressed files
```s
  zcat
  zmore
  zless 

```

<br />

## gzip
* default: after using gzip, the original files will be replaced with *.gz

```s
  gzip [-cdtv#] <file>

  # see the contents of gz
  zcat <file>.gz

  # decompression: replace *.gz with original files
  gzip -d services.gz

  # compress files and keep original files; default -6
  gzip -9 -c -v <file> > <file>.gz

  # fine keywords in gz files
  zgrep -n 'word' <file>.gz

```

<br />

## bzip2
* commands are same as `gzip`
* better than `zgip`
  
```s
  bzip2 [-cdkzv#] <file>
  bzcat <file>.bz2

```

<br />

## xz
* commands are same as `gzip`
  
```s
  xz [-dtlkc#] <file>
  xcat <file>.xz

```

<br />

## tar
* package files, like ` WinRAR`