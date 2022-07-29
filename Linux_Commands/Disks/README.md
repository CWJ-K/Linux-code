<!-- omit in toc -->
# Introduction

<br />

<!-- omit in toc -->
# Table of Contents

<br />

# Fundamental Concepts
## pay attention
* do not use disks currently used


## Steps of adding a new disk in the system
1. partition current disks for an available partition
   1. evaluate the size of the partition
2. format the partition for an available filesystem
   1. evaluate the number of inode and blocks
   2. whether to add a journal
3. check the filesystem
4. mount the filesystem



<br />

# Commands 
## list block devices
```s
    lsblk [-dfimpt] [device]

    lsblk -ip

```

## list block UUID
* UUID: universally unique identifier
  * for mount and identifying devices
```s
    blkid

```

## list the partition of disks
```s
    parted 

```

## partition disks
* MBR Table: `fdisk`
* GPT Table: `gdisk`
```s
    gdisk <device>
```

## update the information of partition
```s
    partprobe 

```

## format partitions
* make filesystem
```s
    # format partitions to xfs systems
    mkfs.xfs [-b bsize] [-d parms] [-i parms] [-l parms] [-L label] [-f] \
                        [-r parms] <device>

    # format partitions to ext4 systems
    mkfs.ext4
```


## mount/umount 
* more information: `/etc/fstab` and `/etc/mtab`

```s
    mount UUID=''

    umount 

```