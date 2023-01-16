CC = gcc
COMPILFLAGS = -no-pie -z noexecstack
SRCDIR = .
OBJ = $(SRCDIR)/main.o \
		$(SRCDIR)/myHello.o \
		$(SRCDIR)/myAdd.o \
		$(SRCDIR)/myByte.o \
		$(SRCDIR)/myByteor.o \
		$(SRCDIR)/myByteorwithoutor.o \
		$(SRCDIR)/myMul2.o \
		$(SRCDIR)/myMul3.o \
		$(SRCDIR)/myIncone.o \
		$(SRCDIR)/myDecone.o \
		$(SRCDIR)/myMul.o \
		$(SRCDIR)/myFactorial.o \
		$(SRCDIR)/myMov.o \
		$(SRCDIR)/myTest.o \
		$(SRCDIR)/myTestu.o \
		$(SRCDIR)/myMulhello.o \
		$(SRCDIR)/myFibo.o \
		$(SRCDIR)/myGetrip.o \
		$(SRCDIR)/myHello2.o \

all: main

main: $(OBJ)
	$(CC) $(COMPILFLAGS) -o $@ $^

%.o: %.S
	nasm -f elf64 -o $@ $<

%.o: %.c
	$(CC) -c -o $@ $<

clean:
	$(RM) main $(OBJ)

.PHONY: all main clean