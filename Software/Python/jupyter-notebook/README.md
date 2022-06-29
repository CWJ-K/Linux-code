<!-- omit in toc -->
# Introduction
How to set the jupyer-notebook environment on Linux?

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [1. ipykernel](#1-ipykernel)
  - [2. Virtualenv](#2-virtualenv)
  - [3. Pipenv](#3-pipenv)
- [Install on Linux](#install-on-linux)
  - [1. Install Ipykernel in virtualenv for jupyter](#1-install-ipykernel-in-virtualenv-for-jupyter)
  - [2. **Activate/ Enter Virtualenv**](#2-activate-enter-virtualenv)
  - [3. Install Jupyter Package](#3-install-jupyter-package)
  - [4. Add Your Virtualenv into Ipykernel](#4-add-your-virtualenv-into-ipykernel)
  - [5. (Optional) Install Jupyter Notebook Extensions](#5-optional-install-jupyter-notebook-extensions)
- [Activate Jupyter Notebook](#activate-jupyter-notebook)
- [Issues](#issues)
  - [1. IOPub data rate exceeded in Jupyter notebook (when viewing image)](#1-iopub-data-rate-exceeded-in-jupyter-notebook-when-viewing-image)
    - [1.1. Solution: expand limitation of data rate in jupyter](#11-solution-expand-limitation-of-data-rate-in-jupyter)
  - [2. ModuleNotFoundError: No module named 'distutils.cmd'](#2-modulenotfounderror-no-module-named-distutilscmd)


<br />

# Fundamental Concepts

## 1. ipykernel
* IPython kernel
* Python execution backend for Jupyter

## 2. Virtualenv 
* a tool to create isolated Python environments
    
## 3. Pipenv 
* automatically creates and manages a virtualenv for your projects
* is both a package and virtual environment management tool that uses the Pipfile and Pipfile.lock files to achieve these goals


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

## 5. (Optional) Install Jupyter Notebook Extensions
> --user: use root

    # before activating pipenv
    pipenv install jupyter_contrib_nbextensions

    # after activating pipenv
    jupyter contrib nbextension install --user

# Activate Jupyter Notebook
> --allow-root: use root

    jupyter notebook --allow-root

# Issues

## 1. IOPub data rate exceeded in Jupyter notebook (when viewing image)

### 1.1. Solution: expand limitation of data rate in jupyter
> --allow-root: use root
jupyter notebook --NotebookApp.iopub_data_rate_limit=1.0e10 --allow-root

## 2. ModuleNotFoundError: No module named 'distutils.cmd'
when `pipenv install ipykernel`, the issue occurs.
It implies the packages aren't installed.

    # get all available versions of distutils
    apt-cache search distutils

    # install appropriate version based on python version
    sudo apt-get install python<version>-distutils