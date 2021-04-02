COMP = gcc
CFLAGS0 = 
CFLAGS  = -g
CFLAGS2 = -O2

intdblconf:	intdblconf1.o intdblconf2.o
	$(COMP) $(CFLAGS2) intdblconf1.o intdblconf2.o -o intdblconf

intdblconf1.o:	intdblconf1.c
	$(COMP) $(CFLAGS2) -c intdblconf1.c 

intdblconf2.o:	intdblconf2.c
	$(COMP) $(CFLAGS2) -c intdblconf2.c 

clean:	
	rm *.o intdblconf
