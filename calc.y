%{ 
/* Definition section */
#include<stdio.h> 
int flag=0; 
%} 

%token NAME NUMBER 

%left GE LE NE EQ '<' '>' '%'

%left '-' '+'

%left '*' '/' 

%NONASSOC UMINUS 


%% 

statement:NAME '=' exp | exp{printf("=%d\n",$1);};

exp:NUMBER {$$=$1;} 

|exp'+'exp {$$=$1+$3;} 

|exp'-'exp {$$=$1-$3;} 
|exp'/'exp {$$=$1/$3;} 
|exp'*'exp {$$=$1*$3;} 
|exp'<'exp {$$=$1<$3;} 
|exp'>'exp {$$=$1>$3;} 
|exp'%'exp {$$=$1%$3;}
|exp GE exp {$$=$1>=$3;} 
|exp LE exp {$$=$1<=$3;} 
|exp EQ exp {$$=$1==$3;} 
|exp NE exp {$$=$1!=$3;}
| '-' exp %prec UMINUS {$$==$2;}
|'('exp')'{$$=$2;}
; 


%% 

//driver code 
int main() 
{ 

yyparse(); 
} 

void yyerror() 
{ 
} 

int yywrap(){
return 1;
}
