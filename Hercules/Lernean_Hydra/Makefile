# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    Makefile                                         .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2017/11/23 09:43:34 by rlossy       #+#   ##    ##    #+#        #
#    Updated: 2018/02/15 11:26:21 by rlossy      ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

NAME		=	hydra
CLIENT		=	client
LIB_DIR		=	./libft
HEADER		=	hydra.h
FILENAMES	=	main.c server.c
CLIENT_SRC	=	client.c

SOURCES		=	$(addprefix ./, $(FILENAMES))
OBJECTS		=	$(addprefix build/, $(FILENAMES:.c=.o)) 

L_FT		=	$(LIB_DIR)
LIB_LNK		=	-L $(L_FT) -l ft
LIB_INC		=	-I $(L_FT)/libft.h


.PHONY: all clean fclean re


all: $(NAME) $(CLIENT)

clean:
	@echo "\033[31m"
	rm -rf build/
	@$(MAKE) -C $(L_FT) clean

fclean: clean
	@echo "\033[31m"
	rm -f $(NAME)
	rm -f $(CLIENT)
	@$(MAKE) -C $(L_FT) fclean

re: 
	@$(MAKE) fclean 
	@$(MAKE) all

build: 
	@echo "\033[35m"
	mkdir build/

$(NAME): $(OBJECTS)
	@$(MAKE) -C $(L_FT)
	@echo "\033[32m"
	gcc -I $(HEADER) $(OBJECTS) $(LIB_LNK) -o $@

$(CLIENT):
	gcc $(CLIENT_SRC) -I $(HEADER) -o $(CLIENT)

build/%.o: ./%.c | build
	gcc $(LIB_INC) -I $(HEADER) -c $< -o $@
