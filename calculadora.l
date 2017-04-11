num [0-9]
let [A-Za-z]
soma [+]
atri [=]
menu [-]
mult [*]
div  [/]
novalinha [\n]
outros [ \t]
%{
 	int numeros,letras, sum, minus, mul, divi, att;
 	char *caracter;
%}

%%
{num}		{numeros++;}
{let}		{letras++;}
{soma}		{sum++;}
{div}		{divi++;}
{atri}		{att++;}
{mult}		{mul++;}
{menu}		{minus++;}
{outros}	;
.			;
{novalinha}	{printf("linha %d tem: %d Letras | %d Números | %d (+) | %d (/) | %d (-) | %d (*) | %d (=)\n", (yylineno-1), letras, numeros, sum, divi, minus, mul, att); zerarContadores();}
%%

int yywrap(void){
	return 1;
}

void zerarContadores(){
	numeros = 0;
	letras = 0; 
	sum = 0; 
	minus = 0;
	mul = 0;
	divi = 0;
	att = 0;
}

int main(int argc, char *argv[]) {
	yyin = fopen(argv[1], "r");
 	yylex();
 	fclose(yyin);
}