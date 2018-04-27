# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    girdle_of_hippolyta.rb                           .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/04/04 11:34:20 by rlossy       #+#   ##    ##    #+#        #
#    Updated: 2018/04/04 11:52:16 by rlossy      ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

# encoding: utf-8

require 'net/smtp'
require 'mail'

options = { :address              => "smtp.laposte.net",
			:port                 => 587,
			:domain               => 'le-101.fr',
			:user_name            => 'romeo.lossy@laposte.net',
			:password             => 'reunion',
			:authentication       => 'plain',
			:enable_starttls_auto => true  }

Mail.defaults do
	delivery_method :smtp, options
end

Mail.deliver do
	to 'romeo.lossy@laposte.net'
	from 'romeo.lossy@laposte.net'
	subject 'I WANT YOU IN MY ARMY !'
	body '
	Here is your General Heracles who speaking ! I got a little message
	for you all, girls :

	IIIII  WW      WW   AAA   NN   NN TTTTTTT  YY   YY  OOOOO  UU   UU  IIIII NN   NN  MM    MM YY   YY    AAA   RRRRRR  MM    MM YY   YY  !!!
	 III   WW      WW  AAAAA  NNN  NN   TTT    YY   YY OO   OO UU   UU   III  NNN  NN  MMM  MMM YY   YY   AAAAA  RR   RR MMM  MMM YY   YY  !!!
	 III   WW   W  WW AA   AA NN N NN   TTT     YYYYY  OO   OO UU   UU   III  NN N NN  MM MM MM  YYYYY   AA   AA RRRRRR  MM MM MM  YYYYY   !!!
	 III    WW WWW WW AAAAAAA NN  NNN   TTT      YYY   OO   OO UU   UU   III  NN  NNN  MM    MM   YYY    AAAAAAA RR  RR  MM    MM   YYY       
	IIIII    WW   WW  AA   AA NN   NN   TTT      YYY    OOOO0   UUUUU   IIIII NN   NN  MM    MM   YYY    AA   AA RR   RR MM    MM   YYY    !!!

	Wanna know why ? So here is a little story from mine :
	
	"King Eurystheus,
	who is always ready to make his daughter happy,
	and send Heracles away again to die,
	commanded him to bring back the Girdle of Hippolyta...
	
	Heracules was not bothered by the task, he was prepared for anything.
	Well, maybe not to fight a whole army by himself.
	He emailed all of his friends to form an army to fight the Amazons.
	
	He also emailed Hippolyte, explaining the situation, asking for the girdle.
	
	Heracules checked his email. His bros and warriors alike responded quickly.
	He set off toward Queen Hippolyte and her tribe.
	Although the piece of armor was special,
	given to her because she was the best warrior among the Amazons,
	she sent a reply to Heracules, saying he could have it.
	
	This made Hera super angry, while she read their emails.
	The army arrived and it was too late.
	Although Hippolyta was ready to hand over the girdle,
	the angry godess Hera had given bad omen to Heracules arrival.
	
	Heracules stabbed Hippolyta and their armies fought!
	Returning to Eurystheus back in Mycenae, Heracules checked his email again.
	Seeing the message from Hippolyta, ignoring it.
	Then a quick "reply all" to his friends.
	The labour was done.
	
	This was just one of many versions of this labour,
	but in no version does Heracules do anything about killing Hippolyta..."'
end
