#include <stdio.h>

int main(int argc, char **argv)
{
	int* p1;
    int* p2 = &p1;
    p1 = &p2;
    printf("",p1);
	return 0;
}
