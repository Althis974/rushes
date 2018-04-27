/* ************************************************************************** */
/*                                                          LE - /            */
/*                                                              /             */
/*   cerberus.h                                       .::    .:/ .      .::   */
/*                                                 +:+:+   +:    +:  +:+:+    */
/*   By: rlossy <rlossy@student.le-101.fr>          +:+   +:    +:    +:+     */
/*                                                 #+#   #+    #+    #+#      */
/*   Created: 2018/04/24 11:09:19 by rlossy       #+#   ##    ##    #+#       */
/*   Updated: 2018/04/25 17:13:18 by rlossy      ###    #+. /#+    ###.fr     */
/*                                                         /                  */
/*                                                        /                   */
/* ************************************************************************** */

#ifndef CERBERUS_H
# define CERBERUS_H
# define RED     "\x1b[31m"
# define GREEN   "\x1b[32m"
# define YELLOW  "\x1b[33m"
# define BLUE    "\x1b[34m"
# define MAGENTA "\x1b[35m"
# define CYAN    "\x1b[36m"
# define RESET   "\x1b[0m"

# include <stdio.h>
# include <netdb.h>
# include <arpa/inet.h>
# include <sys/socket.h>
# include <netinet/in.h>
# include "../libft/libft.h"

typedef struct			s_clt
{
	struct hostent		*server;
	struct sockaddr_in	serv_addr;
	int					bytes;
	int					sent;
	int					received;
	int					total;
	int					message_size;
	int					portno;
	int					sockfd;
	char				*message;
	char				response[4096];
	char				*host;
	char				*path;
}						t_clt;

void					ft_cerberus(void);
void					ft_hell(void);
int						init_socket(int addr, int port,
									struct sockaddr_in server);
int						check_connection(int server_socket,
											struct sockaddr_in client);
void					ft_error(char *msg);
void					ft_process_req(int clt_socket, char *url, char *proto);
int						ft_connect_host(char *dom);
void					ft_get_req(int clt_socket);
char					*ft_get_url(char *url, int fmt);

#endif
