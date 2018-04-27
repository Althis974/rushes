/* ************************************************************************** */
/*                                                          LE - /            */
/*                                                              /             */
/*   server.c                                         .::    .:/ .      .::   */
/*                                                 +:+:+   +:    +:  +:+:+    */
/*   By: rlossy <rlossy@student.le-101.fr>          +:+   +:    +:    +:+     */
/*                                                 #+#   #+    #+    #+#      */
/*   Created: 2018/04/25 10:14:47 by rlossy       #+#   ##    ##    #+#       */
/*   Updated: 2018/04/25 17:28:04 by rlossy      ###    #+. /#+    ###.fr     */
/*                                                         /                  */
/*                                                        /                   */
/* ************************************************************************** */

#include "../includes/cerberus.h"

int		init_socket(int addr, int port, struct sockaddr_in server)
{
	int sockt;

	printf(YELLOW"%s", "\nSocket Initialization....\n");
	if ((sockt = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) == -1)
		ft_error("Socket Initialization : Failed.\nProceed to exit...\n");
	printf("%s", "Socket Initialization : Success.\nProceed to next step...\n"
				"\nBinding...\n");
	server.sin_family = AF_INET;
	server.sin_addr.s_addr = addr;
	server.sin_port = htons(port);
	if ((bind(sockt, (struct sockaddr *)&server, sizeof(server))) != 0)
		ft_error("Binding : Failed.\nProceed to exit...\n");
	printf("%s", "Binding : Success.\nProceed to next step...\n"RESET);
	return (sockt);
}

int		check_connection(int server_socket, struct sockaddr_in client)
{
	int		len;
	int		clt_socket;

	printf(YELLOW"%s", "\nWaiting for connections...\n");
	len = sizeof(struct sockaddr_in);
	if ((clt_socket = accept(server_socket, (struct sockaddr *)&client,
							(socklen_t*)&len)) < 0)
		ft_error("Connection : Refused.\nProceed to exit...\n");
	printf("%s", "Connection : Accepted.\nProceed to next step...\n\n"RESET);
	return (clt_socket);
}

void	ft_cerberus(void)
{
	ft_putstr(RED"\n\t\t\t\t                            /\\_/\\____,\n"
				"\t\t\t\t                  ,___/\\_/\\ \\  ~     /\n"
				"\t\t\t\t                  \\     ~  \\ )   XXX\n"
				"\t\t\t\t                    XXX     /    /\\_/\\___,\n"
				"\t\t\t\t                       \\o-o/-o-o/   ~    /\n"
				"\t\t\t\t                        ) /     \\    XXX\n"
				"\t\t\t\t                       _|    / \\ \\_/\n"
				"\t\t\t\t                    ,-/   _  \\_/   \\\n"
				"\t\t\t\t                   / (   /____,__|  )\n"
				"\t\t\t\t                  (  |_ (    )  \\) _|\n"
				"\t\t\t\t                 _/ _)   \\   \\__/   (_\n"
				"\t\t\t\t                (,-(,(,(,/      \\,),),)\n\n"RESET);
}

void	ft_hell(void)
{
	ft_putstr(RED"     .->    (`-')  _                             <-. (`-')   "
					"(`-')  _    (`-')                     (`-').-> (`-')  _"
					"                  \n (`(`-')/`) ( OO).-/  <-.    _      "
					"       .->      \\(OO )_  ( OO).-/    ( OO).->       .->"
					"        (OO )__  ( OO).-/  <-.      <-.    \n,-`( OO).',"
					"(,------.,--. )   \\-,-----.(`-')----. ,--./  ,-.)(,----"
					"--.    /    '._  (`-')----.     ,--. ,'-'(,------.,--. )"
					"   ,--. )   \n|  |\\  |  | |  .---'|  (`-')  |  .--./( O"
					"O).-.  '|   `.'   | |  .---'    |'--...__)( OO).-.  '   "
					" |  | |  | |  .---'|  (`-') |  (`-') \n|  | '.|  |(|  '-"
					"-. |  |OO ) /_) (`-')( _) | |  ||  |'.'|  |(|  '--.     "
					"`--.  .--'( _) | |  |    |  `-'  |(|  '--. |  |OO ) |  "
					"|OO ) \n|  |.'.|  | |  .--'(|  '__ | ||  |OO ) \\|  |)| "
					" ||  |   |  | |  .--'        |  |    \\|  |)|  |    |  "
					".-.  | |  .--'(|  '__ |(|  '__ | \n|  |.'.|  | |  .--'(|"
					"  '__ | ||  |OO ) \\|  |)|  ||  |   |  | |  .--'        "
					"|  |    \\|  |)|  |    |  .-.  | |  .--'(|  '__ |(|  '__"
					" | \n|   ,'.   | |  `---.|     |'(_'  '--'\\  '  '-'  '|"
					"  |   |  | |  `---.       |  |     '  '-'  '    |  | |  "
					"| |  `---.|     |' |     |' \n`--'   '--' `------'`-----"
					"'    `-----'   `-----' `--'   `--' `------'       `--'  "
					"    `-----'     `--' `--' `------'`-----'  `-----'  \n"
					RESET);
}
