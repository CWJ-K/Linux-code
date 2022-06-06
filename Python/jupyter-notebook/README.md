<!-- omit in toc -->
# Introduction
Take notes of how to set jupyer-notebook environment on Linux

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [ipykernel](#ipykernel)
  - [Virtualenv](#virtualenv)
  - [Pipenv](#pipenv)
    - [Pipfile](#pipfile)
    - [Pipfile.lock](#pipfilelock)
- [Install on Linux](#install-on-linux)
  - [1. Install Ipykernel in virtualenv for jupyter](#1-install-ipykernel-in-virtualenv-for-jupyter)
  - [2. **Activate/ Enter Virtualenv**](#2-activate-enter-virtualenv)
  - [3. Install Jupyter Package](#3-install-jupyter-package)
  - [4. Add Your Virtualenv into Ipykernel](#4-add-your-virtualenv-into-ipykernel)
  - [(Optional) Install Jupyter Notebook Extensions](#optional-install-jupyter-notebook-extensions)
- [Activate Jupyter Notebook](#activate-jupyter-notebook)
- [Issues](#issues)
  - [IOPub data rate exceeded in Jupyter notebook (when viewing image)](#iopub-data-rate-exceeded-in-jupyter-notebook-when-viewing-image)
    - [Solution: expand limitation of data rate in jupyter](#solution-expand-limitation-of-data-rate-in-jupyter)


<br />

# Fundamental Concepts
## ipykernel
* IPython kernel
* Python execution backend for Jupyter
## Virtualenv 
* a tool to create isolated Python environments
    
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

        # create a Pipfile. lock to declare the environment of projects
        pipenv lock

# Install on Linux
## 1. Install [Ipykernel](https://ipython.readthedocs.io/en/stable/install/kernel_install.html) in virtualenv for jupyter
> change directory to project directory

    pipenv install ipykernel


## 2. **Activate/ Enter Virtualenv**

    pipenv shell

## 3. Install Jupyter Package
    python -m pip install jupyter

## 4. Add Your Virtualenv into Ipykernel
> you may have different environment in the same directory. This will help to build different virtualenv in ipykernel

    python -m ipykernel install --user --name=my_virtualenv_name

## (Optional) Install Jupyter Notebook Extensions
> --user: use root

    install jupyter_contrib_nbextensions
    jupyter contrib nbextension install --user

# Activate Jupyter Notebook
> --allow-root: use root

    jupyter notebook --allow-root

# Issues

## IOPub data rate exceeded in Jupyter notebook (when viewing image)
### Solution: expand limitation of data rate in jupyter
> --allow-root: use root
jupyter notebook --NotebookApp.iopub_data_rate_limit=1.0e10 --allow-root