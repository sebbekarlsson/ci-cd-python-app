#!/bin/bash

mysql -e "UPDATE mysql.user SET Password = PASSWORD('abc123') WHERE User = 'root'"
mysql -e "DROP USER ''@'localhost'"
mysql -e "DROP USER ''@'$(hostname)'"
mysql -e "DROP DATABASE test"
mysql -e "FLUSH PRIVILEGES"

mysql -e "CREATE DATABASE pyapp CHARSET=utf8"


mysql -e "CREATE USER 'pyapp'@'localhost' IDENTIFIED BY 'abc123';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'pyapp'@'localhost';"
mysql -e "FLUSH PRIVILEGES"
