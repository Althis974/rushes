# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    new.sh                                           .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/03/15 12:47:48 by rlossy       #+#   ##    ##    #+#        #
#    Updated: 2018/03/15 16:32:14 by rlossy      ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

#!/bin/bash

if [ "$#" -ne 2 ] ; then
	echo "usage: sh $0 dir_path project_name"
else
	DIR=$1
	NAME=$( echo "$2" | tr '[:upper:]'  '[:lower:]' )
	{
		mkdir $DIR/srcs
		mkdir $DIR/includes
		touch $DIR/srcs/main.c
		echo "#include "\"$( echo "$NAME".h)"\"" > $DIR/srcs/main.c
		echo "" >> $DIR/srcs/main.c
		echo "int	main(int ac, char **av)" >> $DIR/srcs/main.c
		echo "{" >> $DIR/srcs/main.c
		echo 'printf("Hello World! %s creation successful!", av[0]);' >> $DIR/srcs/main.c
		echo "return (ac);" >> $DIR/srcs/main.c
		echo "}" >> $DIR/srcs/main.c
		
		touch $DIR/includes/${NAME}.h
		echo "#ifndef $( echo "$NAME" | tr '[:lower:]'  '[:upper:]' )_H" > $DIR/includes/${NAME}.h
		echo "# define $( echo "$NAME" | tr '[:lower:]'  '[:upper:]' )_H" >> $DIR/includes/${NAME}.h
		echo "" >> $DIR/includes/${NAME}.h
		echo "# include <stdio.h>" >> $DIR/includes/${NAME}.h
		echo "" >> $DIR/includes/${NAME}.h
		echo "#endif " >> $DIR/includes/${NAME}.h
	}
fi
exit 0
