# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    cretan_bull.sh                                   .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/03/21 12:44:50 by rlossy       #+#   ##    ##    #+#        #
#    Updated: 2018/03/21 12:54:08 by rlossy      ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

#!/bin/bash

# Champions.
ALL="Alakazam"
OPP="zork"

# Champions directory.
CHAMPS="champs"

# Compiles .s in .cor
rm -f $CHAMPS/$ALL.cor $CHMP_DIR/$OPP.cor
./asm $CHAMPS/$ALL.s && ./asm $CHAMPS/$OPP.s

# Graphic mode.
if [[ ("$1" == "graphic") ]] ; then
		./corewar -n $CHAMPS/$OPP.cor $CHAMPS/$ALL.cor
			exit 0
		fi

# Normal mode
		./corewar $CHAMPS/$OPP.cor $CHAMPS/$ALL.cor
