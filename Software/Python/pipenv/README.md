<!-- omit in toc -->
# Introduction
Pipenv is a higher-level tool to manage packages with virtual environment, which helps to manage Python environment.


<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [1. Pipenv](#1-pipenv)
    - [1.1. Pipfile](#11-pipfile)
    - [1.2. Pipfile.lock](#12-pipfilelock)
  - [2. Python Import](#2-python-import)
    - [2.1. Site-Packages](#21-site-packages)
    - [2.2. pip/pip3](#22-pippip3)
- [Commands](#commands)
  - [1. Install Pipenv](#1-install-pipenv)
  - [2. Update Pipenv](#2-update-pipenv)
  - [3. Create a Pipfile.lock](#3-create-a-pipfilelock)
  - [4. Activate Pipenv](#4-activate-pipenv)
  - [5. Check Versions of Packages in Pipenv](#5-check-versions-of-packages-in-pipenv)
  - [6. Module: Make the Current Directory into Package](#6-module-make-the-current-directory-into-package)
  - [7. Install the Exact Versions Specified in Pipfile.Lock](#7-install-the-exact-versions-specified-in-pipfilelock)
- [Issue](#issue)
  - [1. Still Can Not Update Version Of Numpy To 1.2.1 In Vm](#1-still-can-not-update-version-of-numpy-to-121-in-vm)
  - [2. ERROR: Pipfile.lock not found! You need to run $ pipenv lock before you can continue in CICD.](#2-error-pipfilelock-not-found-you-need-to-run--pipenv-lock-before-you-can-continue-in-cicd)


<br />

# Fundamental Concepts

## 1. Pipenv 
* automatically creates and manages a virtualenv for your projects
* is both a package and virtual environment management tool that uses the Pipfile and Pipfile.lock files to achieve these goals
  
<br />

### 1.1. Pipfile 
* for people to add or remove packages in virtualenv
  

  ```sh
  pipenv install <package>
  pipenv uninstall <package>
  pipenv install --dev <package>
  ```

<br />

### 1.2. Pipfile.lock
* for machines to store detailed environment
* automatically generated; should not be modified users

<br />

## 2. Python Import

### 2.1. [Site-Packages](https://medium.com/@will.wang/%E6%92%A5%E9%96%8B-python-pip-site-packages-%E7%9A%84%E8%97%8D%E8%89%B2%E8%9C%98%E8%9B%9B%E7%B6%B2-90e398bb3785)
* a folder is to store python packages
* each Python version (Minor version) has each site-packages to store packages, examples as below:
  * package_A V3.3.1 and package_A V3.3.2 have the same folder
  * package_A V3.4 and package_A V3.3 have different folders

<br />

### 2.2. pip/pip3
* a python package
* to import packages in site-packages
* see which site-packages is used

  ```sh
  pip --version
  ```

<br />

# Commands

## 1. Install Pipenv
> e.g. use miniconda to install python environment

  ```sh
  pyenv install miniconda3-4.3.30
  
  pyenv global miniconda3-4.3.30

  pip install pipenv
  ```

<br />

## 2. Update Pipenv
> it wil run pipenv lock then pipenv sync

  ```sh
  pipenv update
  ```

<br />

## 3. Create a Pipfile.lock
> create a Pipfile.lock , which declares all dependencies (and sub-dependencies) of your project

  ```sh
  pipenv lock
  ```

<br />

## 4. Activate Pipenv

  ```sh
  pipenv shell
  ```

<br />

## 5. Check Versions of Packages in Pipenv

  ```sh
  # after activating pipenv
  pip freeze
  ```

<br />

## 6. Module: Make the Current Directory into Package
> **setup.py** is required

  ```sh
  pipenv install -e .
  ```

* -e: editable
  installs a pointer file in site-packages that automatically adds the location of the project to Python's module search path.

<br />

## 7. Install the Exact Versions Specified in Pipfile.Lock
        
  ```sh
  pipenv sync
  ```

<br />

# Issue

## 1. Still Can Not Update Version Of Numpy To 1.2.1 In Vm

<br />

## 2. ERROR: Pipfile.lock not found! You need to run $ pipenv lock before you can continue in CICD.

* Case 1: <br />
  when build a docker image
  1. go to the directory with the Dockerfile
  2. pipenv lock
  3. docker build .....  (in the same directory with the Dockerfile because . (the current directory))

* Case 2: <br />
  Make sure the Gitlab CI/CD yml file is in the root of the repository.