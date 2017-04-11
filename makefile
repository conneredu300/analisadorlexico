all:	calc

calc:	lex.yy.c
	cc lex.yy.c -o calc

lex.yy.c:	calculadora.l
	lex -ll calculadora.l

clean:
	rm lex.* y.* calc | clear
