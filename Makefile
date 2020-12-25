CFLAGS = -Wall -O2
LDFLAGS = 

CC = gcc
RM = rm -rf

EXEC=test

OBJS:=test.o hashmap.o

deps := $(OBJS:%.o=.%.o.d)


all: $(EXEC)

%.o: %.c
	$(CC) -o $@ $(CFLAGS) -c -MMD -MF .$@.d $<

$(EXEC): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^

clean:
	$(RM) $(OBJS) $(deps)
	$(RM) $(EXEC)
