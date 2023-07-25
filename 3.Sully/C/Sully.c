#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

#define CODE "#include <stdio.h>%2$c#include <stdlib.h>%2$c#include <string.h>%2$c#include <fcntl.h>%2$c#include <unistd.h>%2$c%2$c#define CODE %4$c%7$s%4$c%2$cint main(){%2$c%1$cint fd;%2$c%1$cint x = %6$d;%2$c%1$cif (x == 0)%2$c%1$c%1$creturn (0);%2$c%1$cchar *res=strchr(__FILE__, %3$c_%3$c);%2$c%1$cif (res != NULL){%2$c%1$c%1$cx = atoi(res + 1) - 1;%2$c%1$c}%2$c%2$c%1$cchar command[100];%2$c%1$cchar file[10];%2$c%2$c%1$csprintf(file, %4$cSully_%5$cd.c%4$c, x);%2$c%1$csprintf(command, %4$cclang -Wall -Werror -Wextra Sully_%5$c1$d.c -o Sully_%5$c1$d && ./Sully_%5$c1$d%4$c, x);%2$c%2$c%1$cfd = open(file, O_WRONLY | O_CREAT | O_TRUNC, 0644);%2$c%1$cif (fd < 0)%2$c%1$c%1$creturn(1);%2$c%1$cdprintf(fd,CODE,9,10,39,34,37,x,CODE);%2$c%1$cclose(fd);%2$c%1$csystem(command);%2$c%1$creturn (0);%2$c}"
int main(){
	int fd;
	int x = 5;
	if (x == 0)
		return (0);
	char *res=strchr(__FILE__, '_');
	if (res != NULL){
		x = atoi(res + 1) - 1;
	}

	char command[100];
	char file[10];

	sprintf(file, "Sully_%d.c", x);
	sprintf(command, "clang -Wall -Werror -Wextra Sully_%1$d.c -o Sully_%1$d && ./Sully_%1$d", x);

	fd = open(file, O_WRONLY | O_CREAT | O_TRUNC, 0644);
	if (fd < 0)
		return(1);
	dprintf(fd,CODE,9,10,39,34,37,x,CODE);
	close(fd);
	system(command);
	return (0);
}