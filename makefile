#################################################
### Makefile written for Self balancing robot ###
#################################################

RM := rm -rf

# Tools
CC        = arm-none-eabi-gcc
OBJDUMP   = arm-none-eabi-objdump
SIZE      = arm-none-eabi-size

# Project Name
TARGET    = SBR

# Linker Script
LD_SCRIPT = stm32f401_ls.ld

# Flags
CPU_FLAGS = -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard

CFLAGS    = $(CPU_FLAGS) -O0 -g3 -Wall -ffunction-sections -fdata-sections

LDFLAGS  = $(CPU_FLAGS) -T$(LD_SCRIPT) -Wl,-Map=$(TARGET).map -Wl,--gc-sections \
	   -static -u _printf_float -Wl,--defsym=end=0

# -------------------------------------
#  LIST OF SOURCE FILES
#  ------------------------------------

SRCS     = Core/Src/main.c \
	   Core/Startup/stm32f401_startup.c

# Include Paths
# INCLUDES = -ICore/Inc

# -------------------------------------
#  Auto-generate .o list from SRCS
# -------------------------------------
OBJS     = $(patsubst %.c,%.o,$(patsubst %.s,%.o,$(SRCS)))

# -------------------------------------
#  Targets
# -------------------------------------
all: $(TARGET).elf size

$(TARGET).elf: $(OBJS) $(LD_SCRIPT)
	$(CC) $(OBJS) $(LDFLAGS) -o $@
	@echo "Linked $@"

# Compile .c files
%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@
	@echo "Compiled: $<"

size: $(TARGET).elf
	$(SIZE) $(TARGET).elf

disasm: $(TARGET).elf
	$(OBJDUMP) -h -S $(TARGET).elf > $(TARGET).list

clean:
	$(RM) $(OBJS) $(TARGET).elf $(TARGET).map $(TARGET).list

load:
	openocd -f /usr/local/share/openocd/scripts/board/stm32f401.cfg \
		-f /usr/local/share/openocd/scripts/target/stm32f4x.cfg

.PHONY: all clean size disasm


