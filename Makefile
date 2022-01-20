CC = gcc
CFLAGS =  -ansi -Wall -g -O0 -Wwrite-strings -Wshadow -pedantic-errors -fstack-protector-all 

all: d8sh

d8sh: d8sh.o executor.o parser.tab.o lexer.o
	$(CC) -lreadline d8sh.o executor.o parser.tab.o lexer.o -o d8sh

dash.o: d8sh.c executor.h lexer.h
	$(CC) $(CFLAGS) -c d8sh.c

executor.o: executor.c executor.h command.h
	$(CC) $(CFLAGS) -c executor.c

parser.tab.o: parser.tab.c command.h
	$(CC) $(CFLAGS) -c parser.tab.c

lexer.o: lexer.c
	$(CC) $(CLFAGS) -c lexer.c

clean: 
	rm -f d8sh ./*~ ./*.o


