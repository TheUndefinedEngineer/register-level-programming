CC=arm-none-eabi-gcc
MACH=cortex-m4
CFLAGS= -c -mcpu=$(MACH) -mthumb -std=gnu11 -Wall -o0

all:stm32f401_startup.o

stm32f401_startup.o:stm32f401_startup.c
	$(CC) -c $(CFLAGS) $^ -o $@

clean:
	rm -rf *.o *.elf
