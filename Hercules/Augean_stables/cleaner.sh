#!/bin/sh

gcc -Wall -Wextra -Werror filthy_stables.c -o cleaned
valgrind --leak-check=yes ./cleaned
