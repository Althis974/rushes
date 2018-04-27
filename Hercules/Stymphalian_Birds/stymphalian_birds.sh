# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    stymphalian_birds.sh                             .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/03/15 10:28:25 by rlossy       #+#   ##    ##    #+#        #
#    Updated: 2018/03/15 16:31:00 by rlossy      ###    #+. /#+    ###.fr      #
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

if [[ ("$1" == "-h") && $# == 1 ]] ; then
	sh ./help/help.sh
elif [[ ("$1" == "-c") && $# == 2 ]] ; then
	NAME=$(echo "$2" | tr '[:upper:]' '[:lower:]')
	echo "\n${Y}################ Name of the project: ${P}$NAME${Y} ##################\n"
	DIR=./$NAME
	{
			if [ -z "$NAME" ] ; then
				echo "${R}Name cannot be NULL."
				exit
			fi
			if [ -d "$NAME" ] ; then
				echo "${R}Directory ${P}$NAME${R} already exists."
				exit
			fi
		while ! mkdir $DIR
		do
			DIR=./$NAME
		done
	}
	echo "${Y}Project path: ${G}${PWD/#$HOME/~}${P}"/$NAME

	# Choose language (or not)
	echo "${C}"
	read -p "What language do you want?: " LANG
	LANG=$(echo "$LANG" | tr '[:upper:]'  '[:lower:]')
	if [[ "$LANG" == "c" ]]; then
		echo "${G}Alright. Let's go !"
	else
		echo "${B}Sorry. I know only C."
	fi
	sh ./srcs/new.sh $DIR $NAME

	# README requirement.
	while true;
	do
		echo "${C}"
		read -p "Need README? (y/n): " yn
		case $yn in
			[Yy]* ) sh ./srcs/readme.sh $DIR $NAME;
				break;;
			[Nn]* )
				break;;
			* ) echo "${B}> (y/n) <";;
		esac
	done

	# Gitignore file requirement.
	while true;
	do
		echo "${C}"
		read -p "Need .gitignore file? (y/n): " yn
		case $yn in
			[Yy]* ) sh ./srcs/gitignore.sh $DIR;
				break;;
			[Nn]* )
				break;;
			* ) echo "${B}>> (y/n) <<";;
		esac
	done

	# Author file requirement.
	while true;
	do
		echo "${C}"
		read -p "Need author file? (y/n): " yn
		case $yn in
			[Yy]* ) sh ./srcs/author.sh $DIR;
				break;;
			[Nn]* )
				break;;
			* ) echo "${B}>>> (y/n) <<<";;
		esac
	done

	# Libft requirement.
	while true;
	do
		echo "${C}"
		read -p "Need libft? (y/n): " yn
		case $yn in
			[Yy]* ) sh ./srcs/libft.sh $DIR; LIB=1;
				break;;
			[Nn]* ) LIB=0;
				break;;
			* ) echo "${B}>>>> (y/n) <<<<";;
		esac
	done

	# Makefile requirement.
	while true;
	do
		echo "${C}"
		read -p "Need Makefile? (y/n): " yn
		case $yn in
			[Yy]* ) sh ./srcs/makefile.sh $DIR $NAME $LIB;
				break;;
			[Nn]* )
				break;;
			* ) echo "${B}>>>>> (y/n) <<<<<";;
		esac
	done

	echo "\n${G}Project ${P}$NAME${G} creation successful."
else
	echo "${Y}usage: sh $0 [-h] [-c project_name]"
fi
exit 0
