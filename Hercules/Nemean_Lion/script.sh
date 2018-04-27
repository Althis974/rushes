#!/bin/bash

#be root
apt-get -y install openssh-server

cat /etc/ssh/sshd_config | sed 's/#Port 22/Port 974/' > new_sshd_config

mv /etc/ssh/sshd_config /etc/ssh/.sshd_config_BACKUP

mv new_sshd_config /etc/ssh/sshd_config

service sshd restart
