# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    mares_of_diomedes.sh                             .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/03/28 10:09:06 by rlossy       #+#   ##    ##    #+#        #
#    Updated: 2018/03/29 11:52:54 by rlossy      ###    #+. /#+    ###.fr      #
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

#Run the fork bomb in background
clear
sleep 1
./bomb/warning.sh
sleep 1
echo "${R}DANGER ! MARES OF DIOMEDES ARE COMING !"
./bomb/manger&

#Wait a bit before process to execution
sleep 1

#Kill all the horses
echo ""
echo "${G}LET'S STOP THEM !"
echo ""
echo "${Y}*EARTHQUAKE*"
kill -6 $(top -l 1 | grep manger | awk '{print $1}')

sleep 1

#Clean all
echo ""
sleep 1
echo "${Y}*BROOM THE CORPSES*"
echo ""
gcc ./strike_back/broom.c -o ./strike_back/broom
./strike_back/broom
rm -rf *.poo
echo ""

#Prepare tsunami !
i=0

while [ $i -lt 5 ]
do
	echo "${R}>>> Critical Alert <<<"
	sleep 1
	i=$[$i + 1]
done

clear
sh ./bomb/alert.sh
sleep 1
clear
echo ""
echo "${P}TIME TO STRIKE BACK !"
echo ""
echo "${C}RELEASE TSUNAMI !"
echo ""
sleep 1

#Release tsunami !
gcc ./strike_back/tsunami.c -o ./strike_back/tsunami
./strike_back/tsunami&

#Wait a bit before process to drought
sleep 1
echo ""
echo "${P}oops, a bit too rude :|"
echo ""
echo "${G}LET'S TAKE CARE OF THAT !"
echo ""

#Rising Sun !
echo "${C}RISING SUN !"
sh ./strike_back/drought.sh
echo ""
echo "${G}WELL DONE GUYS ! *SUCCESS UNLOCKED*"
