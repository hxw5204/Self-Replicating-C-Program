CC := gcc
CFLAGS := -Wall -Wuninitialized -Og -g
PROGS := self 

.PHONY:all
all: $(PROGS) check
self: self.c
	$(CC) $(CFLAGS) -o $@ $<
.PHONY:check
check: self 
	./self >selfoutput.c
	diff selfoutput.c self.c
.PHONY:clean
clean:
	rm -f $(PROGS) selfoutput.c *.o
