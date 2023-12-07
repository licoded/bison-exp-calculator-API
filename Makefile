all: clean calc


calc: calc.l calc.y
	bison -d calc.y
	flex calc.l
	# cc -o $@ calc.tab.c lex.yy.c -lm

clean:
	rm -f \
		exp_lexer.* exp_parser.*