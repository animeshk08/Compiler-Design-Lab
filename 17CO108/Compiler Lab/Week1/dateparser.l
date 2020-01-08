%{ 
   #include<stdio.h> 
   int i=0, year=0, check=0; 
%} 
%% 
(0[1-9]|[1-2][0-9]|[3][0-1])\/((0(1|3|5|7|8))|(10|12))\/([0-9][0-9][0-9][0-9]) {check=1;} 
(0[1-9]|[1-2][0-9]|30)\/((0(4|6|9))|11)\/([0-9][0-9][0-9][0-9]) {check=1;} 
(0[1-9]|1[0-9]|2[0-8])\/02\/([0-9][0-9][0-9][0-9]) {check=1;}
29\/02\/([0-9][0-9][0-9][0-9])    {while(yytext[i]!='/')i++;i++;while(yytext[i]!='/')i++;i++; while(i<yyleng)year=(10*year)+(yytext[i++]-'0');if(year%400==0||(year%100!=0&&year%4==0))check=1;}  
. {check=0;}
\n {return 0;}
%% 
int yywrap() {return 0;}
void main() 
{ 
  yylex(); 
  if(check==1) printf("Valid date\n"); 
  else printf("Not a valid date\n"); 
} 

