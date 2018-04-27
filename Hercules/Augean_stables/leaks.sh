#!/bin/sh

gcc -Wall -Wextra -Werror original_stables.c -o original
valgrind --leak-check=yes ./original
