/* ************************************************************************** */
/*                                                          LE - /            */
/*                                                              /             */
/*   main.c                                           .::    .:/ .      .::   */
/*                                                 +:+:+   +:    +:  +:+:+    */
/*   By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+     */
/*                                                 #+#   #+    #+    #+#      */
/*   Created: 2018/02/14 11:26:37 by rlossy       #+#   ##    ##    #+#       */
/*   Updated: 2018/02/15 11:36:10 by rlossy      ###    #+. /#+    ###.fr     */
/*                                                         /                  */
/*                                                        /                   */
/* ************************************************************************** */

#include "hydra.h"

int		main(int ac, char **av)
{
	struct sockaddr_in	server;
	struct sockaddr_in	client;
	int					srv_socket;
	int					clt_socket;

	if (ac != 2)
	{
		printf("usage: <port number>\n");
		return (1);
	}
	srv_socket = init_socket(INADDR_ANY, atoi(av[1]), server);
	ft_putstr("\nListenning...\n");
	if ((listen(srv_socket, 128)) != 0)
	{
		ft_putstr("Listenning : Failed.\n");
		ft_putstr("Proceed to exit...\n");
		exit(1);
	}
	ft_putstr("Listenning : Success.\n");
	ft_putstr("Proceed to next step...\n");
	clt_socket = check_connection(srv_socket, client);
	get_msg(clt_socket);
	return (0);
}
