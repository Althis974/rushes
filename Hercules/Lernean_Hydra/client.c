/* ************************************************************************** */
/*                                                          LE - /            */
/*                                                              /             */
/*   clent2.c                                         .::    .:/ .      .::   */
/*                                                 +:+:+   +:    +:  +:+:+    */
/*   By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+     */
/*                                                 #+#   #+    #+    #+#      */
/*   Created: 2018/02/15 09:47:44 by rlossy       #+#   ##    ##    #+#       */
/*   Updated: 2018/02/15 11:39:08 by rlossy      ###    #+. /#+    ###.fr     */
/*                                                         /                  */
/*                                                        /                   */
/* ************************************************************************** */

#include "hydra.h"

int	main(int ac, char **av)
{
	int					sock;
	struct sockaddr_in	server;
	char				message[5];
	char				server_reply[2000];
	char				*next;

	if (ac != 3)
	{
		printf("usage: <server ip address> <port number>\n");
		return (1);
	}
/*
** Initialize socket
*/
	sock = socket(AF_INET, SOCK_STREAM, 0);
	if (sock == -1)
		printf("\nSocket Initialization : Failed.\n");
	printf("\nSocket Initialization : Success.\n");
	server.sin_addr.s_addr = inet_addr(av[1]);
	server.sin_family = AF_INET;
	server.sin_port = htons(atoi(av[2]));
/*
** Connection to server
*/
	if (connect(sock, (struct sockaddr *)&server, sizeof(server)) < 0)
	{
		printf("\nConnection : Refused.\n");
		return (1);
	}
	printf("\nConnection : Accepted.\n");
/*
** Communication with server
*/
	while (1)
	{
		printf("\nEnter message : ");
		scanf("%s", message);
/*
** Send message
*/
		if (send(sock, message, strlen(message), 0) < 0)
		{
			printf("\nSend : Failed");
			return (1);
		}
/*
** Receive reply
*/
		if (recv(sock, server_reply, 2000, 0) < 0)
		{
			printf("\nrecv failed");
			break ;
		}
		printf("\nServer reply :");
		printf("\n%s", server_reply);
		if (!(strcmp(server_reply, "Fly, you fool !\n")))
			break ;
	}
	close(sock);
	return (0);
}
