all: clean calc

CC	    =   g++

parser: calc.l calc.y
	bison -d calc.y
	flex calc.l

test-bison: parser test-bison.cpp
	$(CC) -o $@ test-bison.cpp exp_lexer.c exp_parser.c exp_trans.c -lm

clean:
	rm -f \
		exp_lexer.* exp_parser.*