%{ 
/* Definition section */
#include<stdlib.h> 
#include "y.tab.h" 
extern int yylval; 
%} 

/* Rule Section */
%% 
[0-9]+ { 
		yylval=atoi(yytext); 
		return NUMBER; 

	} 
">=" return GE;
"<=" return LE;
"!=" return NE;
"==" return EQ;

[\t] ; 

[\n] return 0; 

. return yytext[0]; 

%% 


