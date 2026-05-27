CC=arm-none-eabi-gcc
MACH=cortex-m4
CFLAGS= -c -mcpu=$(MACH) -mthumb -std=gnu11 -Wall -O0
LDFLAGS = -nostdlib -T $(LINKER) -Wl,-Map=$(BUILD_DIR)/main.map

BUILD_DIR = build
STARTUP_DIR = startup
LINKER_DIR = linker
SRC_DIR = src

TARGET = $(BUILD_DIR)/main.elf
STARTUP = $(STARTUP_DIR)/stm32f401_startup.c
LINKER = $(LINKER_DIR)/stm32f401_ls.ld

all: $(TARGET)

$(TARGET):$(BUILD_DIR)/main.o $(STARTUP_DIR)/stm32f401_startup.o
	$(CC) $(LDFLAGS) $^ -o $@

$(BUILD_DIR)/main.o:$(SRC_DIR)/main.c
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) $^ -o $@

$(STARTUP_DIR)/stm32f401_startup.o: $(STARTUP) 
	$(CC) $(LDFLAGS) $^ -o $@

clean:
	rm -rf $(BUILD_DIR)

load:
	openocd -f /usr/local/share/openocd/scripts/board/stm32f401.cfg \
		-f /usr/local/share/openocd/scripts/target/stm32f4x.cfg


