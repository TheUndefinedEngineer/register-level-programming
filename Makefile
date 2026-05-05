CC=arm-none-eabi-gcc
MACH=cortex-m4
CFLAGS= -c -mcpu=$(MACH) -mthumb -std=gnu11 -Wall -O0
LDFLAGS = -nostdlib -T stm32f401_ls.ld -Wl,-Map=test.map

all:stm32f401_startup.o main.o test.elf

stm32f401_startup.o:stm32f401_startup.c
	$(CC) $(CFLAGS) $^ -o $@

main.o:main.c
	$(CC) $(CFLAGS) $^ -o $@

test.elf: main.o stm32f401_startup.o 
	$(CC) $(LDFLAGS) $^ -o $@

clean:
	rm -rf *.o *.elf
