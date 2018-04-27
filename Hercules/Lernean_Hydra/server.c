/* ************************************************************************** */
/*                                                          LE - /            */
/*                                                              /             */
/*   server.c                                         .::    .:/ .      .::   */
/*                                                 +:+:+   +:    +:  +:+:+    */
/*   By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+     */
/*                                                 #+#   #+    #+    #+#      */
/*   Created: 2018/02/14 11:30:17 by rlossy       #+#   ##    ##    #+#       */
/*   Updated: 2018/02/15 11:39:12 by rlossy      ###    #+. /#+    ###.fr     */
/*                                                         /                  */
/*                                                        /                   */
/* ************************************************************************** */

#include "hydra.h"

int		init_socket(int addr, int port, struct sockaddr_in server)
{
	int	sockt;

	ft_putstr("\nSocket Initialization....\n");
	if ((sockt = socket(PF_INET, SOCK_STREAM, 0)) == -1)
	{
		ft_putstr("Socket Initialization : Failed.\n");
		ft_putstr("Proceed to exit...\n");
		exit(1);
	}
	ft_putstr("Socket Initialization : Success.\n");
	ft_putstr("Proceed to next step...\n");
	ft_putstr("\nBinding...\n");
	server.sin_family = PF_INET;
	server.sin_addr.s_addr = addr;
	server.sin_port = htons(port);
	if ((bind(sockt, (struct sockaddr *)&server, sizeof(server))) != 0)
	{
		ft_putstr("Binding : Failed.\n");
		ft_putstr("Proceed to exit...\n");
		exit(1);
	}
	ft_putstr("Binding : Success.\n");
	ft_putstr("Proceed to next step...\n");
	return (sockt);
}

int		check_connection(int server_socket, struct sockaddr_in client)
{
	int		len;
	int		clt_socket;

	ft_putstr("\nWaiting for connections...\n");
	len = sizeof(struct sockaddr_in);
	if ((clt_socket = accept(server_socket, (struct sockaddr *)&client,
					(socklen_t*)&len)) < 0)
	{
		ft_putstr("Connection : Refused.\n");
		ft_putstr("Proceed to exit...\n");
		exit(1);
	}
	ft_putstr("Connection : Accepted.\n");
	ft_putstr("Proceed to next step...\n");
	return (clt_socket);
}

void	get_msg(int clt_socket)
{
	ssize_t	read_size;
	char	clt_message[BUFF_SIZE];

	ft_putstr("\nMessage reception...\n");
	while ((read_size = recv(clt_socket, clt_message, BUFF_SIZE, 0)) > 0)
	{
		if (!strncmp("ping", clt_message, 4))
			write(clt_socket, "pong pong\n", sizeof("pong pong\n"));
		if (!strncmp("quit", clt_message, 4))
		{
			write(clt_socket, "Fly, you fool !\n", sizeof("Fly, you fool !\n"));
			ft_putstr("Client disconnected.\n");
			ft_putstr("Proceed to server shutdown...\n");
			return ;
		}
		else
			write(clt_socket, "Client, I'm your Server.\n", sizeof("Client, I'm your Server.\n"));
		ft_bzero(clt_message, BUFF_SIZE);
		ft_putstr("Message reception : Success.\n");
	}
	if (read_size == 0)
	{
		ft_putstr("Client disconnected.\n");
		ft_putstr("Proceed to server shutdown...\n");
	}
	else if (read_size == -1)
	{
		ft_putstr("Message reception : Failed.\n");
		ft_putstr("Proceed to server shutdown...\n");
	}
}
