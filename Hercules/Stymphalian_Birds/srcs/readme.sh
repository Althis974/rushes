# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    readme.sh                                        .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/03/15 11:45:31 by rlossy       #+#   ##    ##    #+#        #
#    Updated: 2018/03/15 16:32:25 by rlossy      ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

#!/bin/bash

if [ "$#" -ne 2 ] ; then
	echo "usage: sh $0 dir_path project_name"
else
	DIR=$1
	NAME=$2
	{
		echo "# $NAME\n" > $DIR/README.md
		echo "# Introduction\n" >> $DIR/README.md
		echo ">> What is project ? <<\n" >> $DIR/README.md
		echo "# Objectifs\n" >> $DIR/README.md
		echo ">> What are goals ? <<\n" >> $DIR/README.md
	}
fi
exit 0
