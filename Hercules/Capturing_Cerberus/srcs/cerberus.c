/* ************************************************************************** */
/*                                                          LE - /            */
/*                                                              /             */
/*   cerberus.c                                       .::    .:/ .      .::   */
/*                                                 +:+:+   +:    +:  +:+:+    */
/*   By: rlossy <rlossy@student.le-101.fr>          +:+   +:    +:    +:+     */
/*                                                 #+#   #+    #+    #+#      */
/*   Created: 2018/04/24 11:20:19 by rlossy       #+#   ##    ##    #+#       */
/*   Updated: 2018/04/25 17:23:56 by rlossy      ###    #+. /#+    ###.fr     */
/*                                                         /                  */
/*                                                        /                   */
/* ************************************************************************** */

#include "../includes/cerberus.h"

void	ft_get_req(int clt_socket)
{
	char	buf[BUFF_SIZE];
	char	req[100];
	char	proto[10];
	char	url[100];

	bzero((char*)buf, BUFF_SIZE);
	recv(clt_socket, buf, 500, 0);
	sscanf(buf, "%s %s %s", req, url, proto);
	if ((!strncmp(req, "GET", 3)) && (!strncmp(url, "http://", 7)) &&
		(!strncmp(proto, "HTTP/1.1", 8) || !strncmp(proto, "HTTP/1.0", 8)))
		ft_process_req(clt_socket, url, proto);
	else
		send(clt_socket, "[400] BAD REQUEST\nHTTP REQUESTS ONLY", 36, 0);
}

void	ft_process_req(int clt_socket, char *url, char *proto)
{
	int		host_socket;
	ssize_t	len;
	char	buf[BUFF_SIZE];
	char	*path;
	char	*dom;

	dom = ft_get_url(url, 1);
	path = ft_get_url(url, 0);
	printf(GREEN"Host: %s\nPath: %s\nPort: 80\n"RESET, dom, path);
	host_socket = ft_connect_host(dom);
	bzero((char*)buf, sizeof(buf));
	sprintf(buf, "GET %s %s\r\nHost: %s\r\nConnection: close\r\n\r\n",
			path, proto, dom);
	len = send(host_socket, buf, strlen(buf), 0);
	if (len < 0)
		ft_error("Writing to socket : Refused.\nProceed to exit...\n");
	len = 1;
	while (len > 0)
	{
		bzero((char*)buf, BUFF_SIZE);
		len = recv(host_socket, buf, BUFF_SIZE, 0);
		if (len > 0)
			send(clt_socket, buf, len, 0);
	}
	close(host_socket);
}

int		ft_connect_host(char *dom)
{
	struct sockaddr_in	host;
	struct hostent		*hst;
	int					hst_socket;
	int					n;

	hst = gethostbyname(dom);
	bzero((char*)&host, sizeof(host));
	host.sin_port = htons(80);
	host.sin_family = AF_INET;
	bcopy(hst->h_addr, (char*)&host.sin_addr.s_addr,
		(size_t)hst->h_length);
	hst_socket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
	n = connect(hst_socket, (struct sockaddr*)&host, sizeof(struct sockaddr));
	if (n < 0)
		ft_error(RED"Error in connecting to remote server"RESET);
	printf(GREEN"Connected to %s [ %s ]\n\n"RESET, dom,
		inet_ntoa(host.sin_addr));
	return (hst_socket);
}

char	*ft_get_url(char *url, int fmt)
{
	char	*tmp;
	char	*dom;
	char	*path;

	tmp = strdup(url);
	if (fmt)
	{
		dom = strtok(tmp, "//");
		dom = strdup(strtok(NULL, "/"));
		return (dom);
	}
	tmp += 8;
	path = strchr(tmp, '/');
	return (path);
}
