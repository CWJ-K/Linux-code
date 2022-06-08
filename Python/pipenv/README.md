<!-- omit in toc -->
# Introduction
Take notes of pipenv. Pipenv is a higher-level tool to manage packages with virtual environment, which helps to manage Python environment.


<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [Pipenv](#pipenv)
    - [Pipfile](#pipfile)
    - [Pipfile.lock](#pipfilelock)
  - [Python Import](#python-import)
    - [Site-Packages](#site-packages)
    - [pip/pip3](#pippip3)
- [Commands](#commands)
  - [Update Pipenv](#update-pipenv)
  - [Create a Pipfile.lock](#create-a-pipfilelock)
  - [Activate Pipenv](#activate-pipenv)
  - [Check Versions of Packages in Pipenv](#check-versions-of-packages-in-pipenv)
  - [Module: Make the Current Directory into Package](#module-make-the-current-directory-into-package)
  - [Install the Exact Versions Specified in Pipfile.Lock](#install-the-exact-versions-specified-in-pipfilelock)
- [Issue](#issue)
  - [Still Can Not Update Version Of Numpy To 1.2.1 In Vm](#still-can-not-update-version-of-numpy-to-121-in-vm)
  - [ERROR: Pipfile.lock not found! You need to run $ pipenv lock before you can continue](#error-pipfilelock-not-found-you-need-to-run--pipenv-lock-before-you-can-continue)


<br />

# Fundamental Concepts

## Pipenv 
* automatically creates and manages a virtualenv for your projects
* is both a package and virtual environment management tool that uses the Pipfile and Pipfile.lock files to achieve these goals
  
### Pipfile 
* for people to add or remove packages in virtualenv
  

        pipenv install <package>
        pipenv uninstall <package>
        pipenv install --dev <package>


### Pipfile.lock
* for machines to store detailed environment
* automatically generated; should not be modified users

<br />

## Python Import

### [Site-Packages](https://medium.com/@will.wang/%E6%92%A5%E9%96%8B-python-pip-site-packages-%E7%9A%84%E8%97%8D%E8%89%B2%E8%9C%98%E8%9B%9B%E7%B6%B2-90e398bb3785)
* a folder is to store python packages
* each Python version (Minor version) has each site-packages to store packages 
  * V3.3.1 and V3.3.2 have the same folder
  * V3.4 and V3.3 have different folders


### pip/pip3
* a python package
* to import packages in site-packages
* see which site-packages is used
        pip --version

<br />

# Commands

## Update Pipenv
> it wil run pipenv lock then pipenv sync

        pipenv update


## Create a Pipfile.lock
> create a Pipfile.lock , which declares all dependencies (and sub-dependencies) of your project

        pipenv lock

## Activate Pipenv

        pipenv shell


## Check Versions of Packages in Pipenv

        # after activating pipenv
        pip freeze


## Module: Make the Current Directory into Package
> **setup.py** is required

        pipenv install -e .

* -e: editable
  installs a pointer file in site-packages that automatically adds the location of the project to Python's module search path.


## Install the Exact Versions Specified in Pipfile.Lock
        
        pipenv sync

<br />

# Issue
## Still Can Not Update Version Of Numpy To 1.2.1 In Vm

<br />

## ERROR: Pipfile.lock not found! You need to run $ pipenv lock before you can continue

when build docker image
1. go to directory with the Dockerfile
2. pipenv lock
3. docker build .....  (in the same directory with the Dockerfile because . (the current directory))