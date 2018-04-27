# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    alakazam.s                                       .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/03/21 10:39:51 by rlossy       #+#   ##    ##    #+#        #
#    Updated: 2018/03/21 12:40:34 by rlossy      ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

.name		"Alakazam"

.comment	"There is no Spoon."

entry:	;Psychic
		fork %:spawn; Create New process

main:	;Calm_Mind
		sti r1, %:live, %1;
		and r1, %0, r1;

live:	;Recover
		live %1;
		zjmp %:live;

spawn:	;Teleport
		live %1; 
