%{
	#include <stdio.h>
	#include <stdlib.h>
	int yylex(void);
%}
%token NUMERO
%left '+'
%%
programa:	programa seg '\n'
			;
seg:		n1	{printf("%d\n", $1);}
			;
n1:			NUMERO
			| n1 '+' n1	{ $$=$1+$2; }
			;
%%

void yyerror(char *s){
	fprintf(stderr, "%s\n", s);
}

int main(void){
	yyparse();
	return 0;
}