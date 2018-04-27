/* ************************************************************************** */
/*                                                          LE - /            */
/*                                                              /             */
/*   client.c                                         .::    .:/ .      .::   */
/*                                                 +:+:+   +:    +:  +:+:+    */
/*   By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+     */
/*                                                 #+#   #+    #+    #+#      */
/*   Created: 2018/04/26 11:11:23 by rlossy       #+#   ##    ##    #+#       */
/*   Updated: 2018/04/26 11:12:59 by rlossy      ###    #+. /#+    ###.fr     */
/*                                                         /                  */
/*                                                        /                   */
/* ************************************************************************** */

#include "../includes/cerberus.h"

static void	ft_perror(char *msg)
{
	printf(RED"%s\n"RESET, msg);
	exit(1);
}

static void	ft_init(t_clt *clt, int ac, char **av, int i)
{
	clt->message_size = 0;
	clt->portno = atoi(av[2]) > 0 ? atoi(av[2]) : 80;
	clt->host = strlen(av[1]) > 0 ? av[1] : "localhost";
	clt->path = strlen(av[4]) > 0 ? av[4] : "/";
	if (!strcmp(av[3], "GET"))
	{
		printf(YELLOW"%s"RESET, "Initialization : GET method request\n");
		clt->message_size += strlen("%s %s%s%s HTTP/1.0\r\nHost: %s\r\n");
		clt->message_size += strlen(av[3]);
		clt->message_size += strlen(clt->path);
		i = -1;
		while (++i < ac)
			clt->message_size += strlen(av[i]) + strlen("\r\n");
		clt->message_size += strlen("\r\n");
	}
	else
		ft_perror("Too bad. Only GET method is supported.");
	printf(YELLOW"\nAllocating...\n"RESET);
	clt->message = malloc(clt->message_size);
	sprintf(clt->message, "%s %s HTTP/1.0\r\nHost: %s\r\n",
			strlen(av[3]) > 0 ? av[3] : "GET",
			clt->path, clt->host);
}

static void	ft_req(t_clt *clt)
{
	clt->server = gethostbyname(clt->host);
	if (clt->server == NULL)
		ft_perror("ERROR, no such host");
	clt->sockfd = socket(AF_INET, SOCK_STREAM, 0);
	if (clt->sockfd < 0)
		ft_perror("ERROR opening socket");
	memset(&clt->serv_addr, 0, sizeof(clt->serv_addr));
	clt->serv_addr.sin_family = AF_INET;
	clt->serv_addr.sin_port = htons(clt->portno);
	memcpy(&clt->serv_addr.sin_addr.s_addr, clt->server->h_addr,
		clt->server->h_length);
	if (connect(clt->sockfd, (struct sockaddr *)&clt->serv_addr,
				sizeof(clt->serv_addr)) < 0)
		ft_perror("ERROR connecting");
	clt->sent = 0;
	while (clt->sent < clt->total)
	{
		clt->bytes = write(clt->sockfd, (clt->message + clt->sent),
			(clt->total - clt->sent));
		if (clt->bytes < 0)
			ft_perror("ERROR writing message to socket");
		if (clt->bytes == 0)
			break ;
		clt->sent += clt->bytes;
	}
}

static void	ft_response(t_clt *clt)
{
	memset(clt->response, 0, sizeof(clt->response));
	clt->total = sizeof(clt->response) - 1;
	clt->received = 0;
	printf(YELLOW"Response : \n\n"RESET);
	while (101)
	{
		printf(CYAN"%s"RESET, clt->response);
		memset(clt->response, 0, sizeof(clt->response));
		clt->bytes = recv(clt->sockfd, clt->response, 1024, 0);
		if (clt->bytes < 0)
			ft_perror("ERROR reading response from socket");
		if (clt->bytes == 0)
			break ;
		clt->received += clt->bytes;
	}
	if (clt->received == clt->total)
		ft_perror("ERROR storing complete response from socket");
}

int			main(int ac, char **av)
{
	int		i;
	t_clt	clt;

	if (ac != 5)
		ft_perror("Parameters: <host> <port> <method> <path>");
	ft_init(&clt, ac, av, i);
	i = -1;
	while (++i < ac)
	{
		strcat(clt.message, av[i]);
		strcat(clt.message, "\r\n");
	}
	strcat(clt.message, "\r\n");
	printf(YELLOW"Processed.\n\n"RESET);
	printf(BLUE"-----------------------------------------------"RESET);
	printf(YELLOW"\n\nRequest :\n\n"RESET);
	printf(MAGENTA"%s"RESET, clt.message);
	printf(BLUE"-----------------------------------------------\n\n"RESET);
	clt.total = strlen(clt.message);
	ft_req(&clt);
	ft_response(&clt);
	close(clt.sockfd);
	free(clt.message);
	return (0);
}
