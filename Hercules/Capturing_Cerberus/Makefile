# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    Makefile                                         .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/03/14 14:34:00 by rlossy       #+#   ##    ##    #+#        #
#   Updated: 2018/04/26 11:03:55 by rlossy      ###    #+. /#+    ###.fr     # #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

NAME		=	cerberus
CLIENT      =   client
LIB_DIR		=	./libft
HEADER		=	./includes/cerberus.h
FILENAMES	=	main.c cerberus.c server.c

SOURCES		=	$(addprefix srcs/, $(FILENAMES))
OBJECTS		=	$(addprefix build/, $(FILENAMES:.c=.o)) 

L_FT		=	$(LIB_DIR)
LIB_LNK		=	-L $(L_FT) -l ft
LIB_INC		=	-I $(L_FT)/libft.h

FLAGS		=	-Wall -Wextra -Werror

LOADIR		=	/Users/rlossy/unitest/load
LOADF		=	$(LOADIR)/loading.sh

.PHONY: all clean fclean re


all: $(NAME) $(CLIENT)

clean:
	@echo "\033[31m"
	@sh $(LOADF) $@ r n $(NAME)
	@rm -rf build/
	@printf "\n\033[1m\033[34m\t\t\t\t⥷ $(NAME)⭃\tObject Files\t\033[0m\
	\033[1m⟿ \t\033[31mDeletion Success\033[0m ✅\n"
	@$(MAKE) -C $(L_FT) clean

fclean: clean
	@echo "\033[31m"
	@sh $(LOADF) $@ r n $(NAME)
	@rm -f $(NAME)
	@rm -f $(CLIENT)
	@printf "\n\033[1m\033[34m\t\t\t\t⥷ $(NAME)⭃\tCompiled Files\t\033[0m\
	\033[1m⟿ \t\033[31mDeletion Success\033[0m ✅\n"
	@$(MAKE) -C $(L_FT) fclean

re: 
	@$(MAKE) fclean 
	@$(MAKE) all

build: 
	@echo "\033[35m"
	@mkdir build/

$(NAME): $(OBJECTS)
	@printf "\n\033[1m\033[34m\t\t\t\t⥷ $@⭃\tObject Files\033[0m \
		\033[1m⟿ \t\033[32mCreation Success\033[0m ✅\n"
	@$(MAKE) -C $(L_FT)
	@echo "\033[42m\033[30m"
	@sh $(LOADF) $@ e n $(NAME)
	@echo "\033[0m"
	@gcc -I $(HEADER) $(OBJECTS) $(LIB_LNK) -o $@
	@printf "\n\033[1m\033[34m\t\t\t\t⥷ $@⭃\tProject\t\t\033[0m \033[1m⟿  \
		\033[32mCreation Success\033[0m ✅\n"

$(CLIENT):
	@echo "\033[42m\033[30m"
	@sh $(LOADF) $@ e n $(CLIENT)
	@echo "\033[0m"
	@gcc srcs/$(CLIENT).c -I $(HEADER) $(LIB_LNK) -o $@
	@printf "\n\033[1m\033[34m\t\t\t\t⥷ $@⭃\tProject\t\t\033[0m \033[1m⟿  \
		\033[32mCreation Success\033[0m ✅\n"

build/%.o: srcs/%.c $(HEADER) | build
	@sh $(LOADF) $< o y
	@gcc $(LIB_INC) -I $(HEADER) -c $< -o $@
