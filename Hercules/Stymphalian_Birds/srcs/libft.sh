# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    libft.sh                                         .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/03/15 11:52:05 by rlossy       #+#   ##    ##    #+#        #
#    Updated: 2018/03/15 16:29:26 by rlossy      ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

#!/bin/bash

R='\033[31m'
Y='\033[33m'
G='\033[32m'
B='\033[34m'
P='\033[35m'
C='\033[36m'
D='\033[0m'

if [ "$#" -ne 1 ] ; then
	echo "usage: sh $0 lib_path"
else
	DIR=$1
	mkdir -p $DIR/libft
	read -p "Specify libft location: ~/" lib_path
	cp -R ~/$lib_path/* "$DIR/libft"
	if [ $? -eq 0 ] ; then
		echo "${Y}Libft found !"
	else
		echo "${R}Error : Libft not found."
		rm -rf $DIR/libft
		cp -R ~/Cursus/algo_branch/ft_printf/libft "$DIR/libft"
		echo "${Y}Here is one."
	fi
fi
exit 0
