# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    apples_of_the_Hesperides.sh                      .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/04/18 11:43:59 by rlossy       #+#   ##    ##    #+#        #
#    Updated: 2018/04/18 13:09:45 by rlossy      ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

#!/bin/bash

# Usage message if number of arguments are invalid.
if [ "$#" -ne 2 ] ; then
	echo "usage: $0 <user> <ip-address>"
	exit 1
fi

# Stores ssh username and ip address
USR=$1
IPADDR=$2

# Create Authentication SSH-Kegen Keys
ssh-keygen

# Upload Generated Public Keys on VM
ssh-copy-id -i ~/.ssh/id_rsa.pub $USR@$IPADDR -p 2222

# Connection to VM
ssh $USR@$IPADDR -p 2222
