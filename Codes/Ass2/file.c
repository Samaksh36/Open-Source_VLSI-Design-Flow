//#include <stdio.h>
#include <stdbool.h>
long func(int,int,bool);
main()
{
int j=1; int k=2;
bool c= false;
int res = func(j,k,c);
return 0;
}
long func(int j,int k,bool c)
{
int i=0;
if(c){
i = j + k;
}else{
i = j - k;
}
return i;
}
