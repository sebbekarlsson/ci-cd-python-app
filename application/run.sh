#!/bin/bash

virtualenv -p $(which python3) ./venv
./venv/bin/python setup.py develop

systemctl daemon-reload
systemctl restart pyapp
