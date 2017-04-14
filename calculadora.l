num [0-9]
let [A-Za-z]
soma [+]
atri [=]
menu [-]
mult [*]
div  [/]
int  "int"|"INT"|"Int"|"iNt"|"inT"
str  "str"|"STR"|"Str"|"sTr"|"stR"
novalinha [\n]
outros [ \t]
%{
 	int numeros,letras, sum, minus, mul, divi, att, varstr, varint;
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
{int}		{printf(" **variavel do tipo int** ");}
{str}		{printf(" **variavel do tipo str** ");}
"$I"		{printf(" $$ Algarismo romano %d $$ ",1);}
"$II"		{printf(" $$ Algarismo romano %d $$ ",2);}
"$III"		{printf(" $$ Algarismo romano %d $$ ",3);}	
"$IV"		{printf(" $$ Algarismo romano %d $$ ",4);}
"$V"		{printf(" $$ Algarismo romano %d $$ ",5);}
"$VI"		{printf(" $$ Algarismo romano %d $$ ",6);}
"$VII"		{printf(" $$ Algarismo romano %d $$ ",7);}
"$VII"		{printf(" $$ Algarismo romano %d $$ ",8);}
"$IX"		{printf(" $$ Algarismo romano %d $$ ",9);}
"$X"		{printf(" $$ Algarismo romano %d $$ ",10);}
{outros}	;
.		;
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
	if(argc == 0)
	   return 0;
	yyin = fopen(argv[1], "r");
 	yylex();
 	fclose(yyin);
}
