/* ************************************************************************** */
/*                                                          LE - /            */
/*                                                              /             */
/*   filthy_stables.c                                 .::    .:/ .      .::   */
/*                                                 +:+:+   +:    +:  +:+:+    */
/*   By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+     */
/*                                                 #+#   #+    #+    #+#      */
/*   Created: 2018/03/07 09:50:45 by rlossy       #+#   ##    ##    #+#       */
/*   Updated: 2018/03/07 10:55:32 by rlossy      ###    #+. /#+    ###.fr     */
/*                                                         /                  */
/*                                                        /                   */
/* ************************************************************************** */

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

long	sum_array(int *array, int size)
{
	long	sum;
	int		index;

	sum = 0;
	index = 0;
	while (index < size)
	{
		sum += array[index];
		index++;
	}
	return (sum);
}

void	allocate_loads_of_memory(void)
{
	int		*p1;
	char	*p2;
	int		*p3;
	int		index;

	index = 0;
	p1 = (int*)malloc(sizeof(int) * 4242);
	p2 = (char*)malloc(sizeof(char*) * 42);
	p3 = (int*)malloc(sizeof(int) * 424242);
	if (!(p1) || !(p2) || !(p3))
		return ;
	bzero(p1, 4242 * sizeof(int));
	bzero(p2, 42 * sizeof(char*));
	bzero(p3, 424242 * sizeof(int));
	memset(p2, 42, 42);
	memset(p1, 42, 4242);
	while (index++ < 424242)
		p3[index] = index * 42;
	printf("%ld\n%s\n%ld\n", sum_array(p1, 4242), p2, sum_array(p3, 424242));
	free(p1);
	free(p2);
	free(p3);
	p1 = NULL;
	p2 = NULL;
	p3 = NULL;
}

int		main(void)
{
	allocate_loads_of_memory();
	return (0);
}
