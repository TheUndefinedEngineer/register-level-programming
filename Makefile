CC=arm-none-eabi-gcc
MACH=cortex-m4
CFLAGS= -c -mcpu=$(MACH) -mthumb -std=gnu11 -Wall -O0
LDFLAGS = -nostdlib -T stm32f401_ls.ld -Wl,-Map=test.map

all:stm32f401_startup.o main.o led.elf

stm32f401_startup.o:stm32f401_startup.c
	$(CC) $(CFLAGS) $^ -o $@

main.o:main.c
	$(CC) $(CFLAGS) $^ -o $@

led.elf: main.o stm32f401_startup.o 
	$(CC) $(LDFLAGS) $^ -o $@

clean:
	rm -rf *.o *.elf

load:
	openocd -f /usr/local/share/openocd/scripts/board/stm32f401.cfg \
		-f /usr/local/share/openocd/scripts/target/stm32f4x.cfg


