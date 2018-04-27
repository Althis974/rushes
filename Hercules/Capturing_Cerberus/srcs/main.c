/* ************************************************************************** */
/*                                                          LE - /            */
/*                                                              /             */
/*   main.c                                           .::    .:/ .      .::   */
/*                                                 +:+:+   +:    +:  +:+:+    */
/*   By: rlossy <rlossy@student.le-101.fr>          +:+   +:    +:    +:+     */
/*                                                 #+#   #+    #+    #+#      */
/*   Created: 2018/04/24 10:56:15 by rlossy       #+#   ##    ##    #+#       */
/*   Updated: 2018/04/25 17:28:04 by rlossy      ###    #+. /#+    ###.fr     */
/*                                                         /                  */
/*                                                        /                   */
/* ************************************************************************** */

#include "../includes/cerberus.h"

void	ft_error(char *err)
{
	printf(RED"%s\n"RESET, err);
	exit(1);
}

int		main(int ac, char **av)
{
	struct sockaddr_in	server;
	struct sockaddr_in	client;
	int					srv_socket;
	int					clt_socket;

	if (ac != 2)
		ft_error("usage: ./cerberus <port_number>");
	ft_hell();
	ft_cerberus();
	srv_socket = init_socket(INADDR_ANY, atoi(av[1]), server);
	bzero((char*)&server, sizeof(server));
	printf(YELLOW"%s"RESET, "\nListenning...\n");
	if ((listen(srv_socket, 128)) != 0)
		ft_error("Listenning : Failed.\nProceed to exit...");
	printf(YELLOW"%s"RESET, "Listenning : Success.\nProceed to next step...\n");
	clt_socket = check_connection(srv_socket, client);
	while (101)
		ft_get_req(clt_socket);
	return (0);
}
