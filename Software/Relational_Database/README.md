# phpMyadmin
use static IP of VM to connect to phpMyadmin UI
=> VM_ip:port

https://superuser.com/a/1120146



# Types of Database
|Type|Relation Database|Time Series Database|
||MySQL|InfluxDB, kdb+, TimescaleDB, DolphinDB|


# in yaml, command:
    https://www.jianshu.com/p/fcd31e44129c
    
    version: '3.3'
    services:
    mysql:
        image: mysql:8.0
        command: mysqld --default-authentication-plugin=mysql_native_password