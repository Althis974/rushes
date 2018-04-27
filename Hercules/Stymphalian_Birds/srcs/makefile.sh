# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    makefile.sh                                      .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/03/15 11:54:35 by rlossy       #+#   ##    ##    #+#        #
#    Updated: 2018/03/15 14:47:37 by rlossy      ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

#!/bin/bash

R='@echo "\\033[31m"'
Y='@echo "\\033[33m"'
G='@echo "\\033[32m"'
C='@echo "\\033[36m"'
B='@echo "\\033[34m"'
P='@echo "\\033[35m"'
W='@echo "\\033[37m"'

if [ "$#" -ne 3 ] ; then
	echo "usage: sh $0 dir_path project_name lib_flag"
elif [ "$3" -ne 1 ] ; then
	DIR=$1
	NAME=$2
	{
		touch $DIR/Makefile
		echo "NAME		=	$(echo "$NAME")" > $DIR/Makefile
		echo "INCLUDES	=	./includes/" >> $DIR/Makefile
		echo "FILENAMES	=	main.c" >> $DIR/Makefile
		echo "" >> $DIR/Makefile
		echo "SOURCES		=	\$(addprefix srcs/, \$(FILENAMES))" >> $DIR/Makefile
		echo "OBJECTS		=	\$(addprefix build/, \$(FILENAMES:.c=.o))" >> $DIR/Makefile
		echo "" >> $DIR/Makefile
		echo "FLAGS		=	-Wall -Wextra -Werror" >> $DIR/Makefile
		echo "\n" >> $DIR/Makefile
		echo ".PHONY: all clean fclean re" >> $DIR/Makefile
		echo "\n" >> $DIR/Makefile
		echo "all: \$(NAME)" >> $DIR/Makefile
		echo "" >> $DIR/Makefile
		echo "clean:\n	$R\n	rm -rf build/" >> $DIR/Makefile
		echo "" >> $DIR/Makefile
		echo "fclean: clean\n	$R\n	rm -f \$(NAME)" >> $DIR/Makefile
		echo "" >> $DIR/Makefile
		echo "re: fclean all" >> $DIR/Makefile
		echo "" >> $DIR/Makefile
		echo "build:\n	$P\n	mkdir build/" >> $DIR/Makefile
		echo "" >> $DIR/Makefile
		echo "\$(NAME): \$(OBJECTS)\n	$G\n	gcc \$(FLAGS) -I \$(INCLUDES) \$(OBJECTS) -o \$@" >> $DIR/Makefile
		echo "" >> $DIR/Makefile
		echo "build/%.o: srcs/%.c | build\n	gcc \$(FLAGS) -I \$(INCLUDES) -c $< -o \$@" >> $DIR/Makefile
	}
else
	DIR=$1
	NAME=$2
	{
		touch $DIR/Makefile
		echo "NAME		=	$(echo "$NAME")" > $DIR/Makefile
		echo "LIB_DIR		=	./libft" >> $DIR/Makefile
		echo "INCLUDES	=	./includes/" >> $DIR/Makefile
		echo "FILENAMES	=	main.c" >> $DIR/Makefile
		echo "" >> $DIR/Makefile
		echo "SOURCES	=	\$(addprefix srcs/, \$(FILENAMES))" >> $DIR/Makefile
		echo "OBJECTS	=	\$(addprefix build/, \$(FILENAMES:.c=.o))" >> $DIR/Makefile
		echo "" >> $DIR/Makefile
		echo "FLAGS	=	-Wall -Wextra -Werror\n" >> $DIR/Makefile
		echo "L_FT	=	\$(LIB_DIR)" >> $DIR/Makefile
		echo "LIB_LNK	=	-L \$(L_FT) -l ft" >> $DIR/Makefile
		echo "LIB_INC	=	-I \$(L_FT)/libft.h" >> $DIR/Makefile
		echo "\n" >> $DIR/Makefile
		echo ".PHONY: all clean fclean re" >> $DIR/Makefile
		echo "\n" >> $DIR/Makefile
		echo "all: \$(NAME)" >> $DIR/Makefile
		echo "" >> $DIR/Makefile
		echo "clean:\n	$R\n	rm -rf build/\n	@\$(MAKE) -C \$(L_FT) clean" >> $DIR/Makefile
		echo "" >> $DIR/Makefile
		echo "fclean: clean\n	$R\n	rm -f \$(NAME)\n	@\$(MAKE) -C \$(L_FT) fclean" >> $DIR/Makefile
		echo "" >> $DIR/Makefile
		echo "re:\n	@\$(MAKE) fclean\n	@\$(MAKE) all" >> $DIR/Makefile
		echo "" >> $DIR/Makefile
		echo "build:\n	$P\n	mkdir build/" >> $DIR/Makefile
		echo "" >> $DIR/Makefile
		echo "\$(NAME): \$(OBJECTS)\n	@\$(MAKE) -C \$(L_FT)\n	$G\n	gcc \$(FLAGS) -I \$(INCLUDES) \$(OBJECTS) \$(LIB_LNK) -o \$@" >> $DIR/Makefile
		echo "" >> $DIR/Makefile
		echo "build/%.o: srcs/%.c | build\n	gcc \$(FLAGS) \$(LIB_INC) -I \$(INCLUDES) -c $< -o \$@" >> $DIR/Makefile
	}
fi
exit 0
