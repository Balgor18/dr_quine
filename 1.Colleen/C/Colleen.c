#include <stdio.h>

#define STRING "#include <stdio.h>%2$c%2$c#define STRING %3$c%4$s%3$c%2$c// This comment is outside%2$cvoid%1$cprint(const char *str)%2$c{%2$c%1$cprintf(str, 9, 10, 34, str);%2$c}%2$cint%1$cmain()%2$c{%2$c%1$cprint(STRING);%2$c%1$creturn (0);%2$c}%2$c"
// This comment is outside
void	print(const char *str)
{
	printf(str, 9, 10, 34, str);
}
int	main()
{
	print(STRING);
	return (0);
}
