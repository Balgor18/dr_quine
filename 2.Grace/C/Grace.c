/*
	This code is a self duplication
*/
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

#define FILENAME "Grace_kid.c"
#define CODE "/*%1$c	This code is a self duplication%1$c*/%1$c#include <stdio.h>%1$c#include <fcntl.h>%1$c#include <unistd.h>%1$c%1$c#define FILENAME %2$cGrace_kid.c%2$c%1$c#define CODE %2$c%3$s%2$c%1$c#define LAUNCH() int main(void) {int fd = open(FILENAME, O_CREAT|O_WRONLY|O_TRUNC, 0644); if (fd < 0) return (1); dprintf(fd, CODE, 10, 34, CODE); close(fd);return 0;}%1$c%1$cLAUNCH()%1$c"
#define LAUNCH() int main(void) {int fd = open(FILENAME, O_CREAT|O_WRONLY|O_TRUNC, 0644); if (fd < 0) return (1); dprintf(fd, CODE, 10, 34, CODE); close(fd);return 0;}

LAUNCH()
