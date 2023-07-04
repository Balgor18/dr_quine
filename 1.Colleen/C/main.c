#include <stdio.h>

#define STRING "#include <stdio.h>%c%c#define STRING %c%s%c%c// This comment is outside%cvoid%cprint(const char *str)%c{%c%cprintf(str, 10, 10, 34, str, 34, 10, 10, 9, 10, 10, 9, 10, 10 , 9, 10 , 10, 9, 10, 9, 10, 10);%c}%cint%cmain()%c{%c%cprint(STRING);%c%creturn (0);%c}%c"
// This comment is outside
void	print(const char *str)
{
	printf(str, 10, 10, 34, str, 34, 10, 10, 9, 10, 10, 9, 10, 10 , 9, 10 , 10, 9, 10, 9, 10, 10);
}
int	main()
{
	print(STRING);
	return (0);
}
