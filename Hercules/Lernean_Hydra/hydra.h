/* ************************************************************************** */
/*                                                          LE - /            */
/*                                                              /             */
/*   hydra.h                                          .::    .:/ .      .::   */
/*                                                 +:+:+   +:    +:  +:+:+    */
/*   By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+     */
/*                                                 #+#   #+    #+    #+#      */
/*   Created: 2018/02/14 10:05:50 by rlossy       #+#   ##    ##    #+#       */
/*   Updated: 2018/02/15 11:06:58 by rlossy      ###    #+. /#+    ###.fr     */
/*                                                         /                  */
/*                                                        /                   */
/* ************************************************************************** */

#ifndef HYDRA_H
# define HYDRA_H

# include <stdio.h>
# include <sys/socket.h>
# include <arpa/inet.h>
# include "libft/libft.h"

int		init_socket(int addr, int port, struct sockaddr_in server);
int		check_connection(int server_socket, struct sockaddr_in client);
void	get_msg(int clt_socket);

#endif
