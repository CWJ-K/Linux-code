

### update pipenv:  it wil run pipenv lock then pipenv sync
```pipenv update```
```pipenv lock``` 
 create a Pipfile. lock , which declares all dependencies (and sub-dependencies) of your project

### activate pipenv
```pipenv shell```


### check versions of packages after activating pipenv
```pip freeze```


# module: make directory into package
should with setup.py
    pipenv install -e .

https://stackoverflow.com/a/53378506
https://medium.com/@will.wang/%E6%92%A5%E9%96%8B-python-pip-site-packages-%E7%9A%84%E8%97%8D%E8%89%B2%E8%9C%98%E8%9B%9B%E7%B6%B2-90e398bb3785


# sync
pipenv sync

### issue
* still can not update version of numpy to 1.2.1 in VM

