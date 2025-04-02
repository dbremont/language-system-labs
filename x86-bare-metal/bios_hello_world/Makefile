# Tools and flags
TOOLS_DIR = ../tools
CC = gcc
ASFLAGS = -m32 -c -ggdb3
LD = ld
LDFLAGS = -melf_i386 -nostdlib -T  $(TOOLS_DIR)/linker.ld
OBJCOPY = objcopy
QEMU ?= qemu-system-i386


# Files
SOURCE = bios_hello_world.S
OBJECT = bios_hello_world.o
ELF = bios_hello_world.elf
TARGET = bios_hello_world.img

# Default target
all: $(TARGET)

# Assemble the source file
$(OBJECT): $(SOURCE)
	$(CC) $(ASFLAGS) -o $@ $<

# Link the object file into an ELF executable
$(ELF): $(OBJECT)
	$(LD) $(LDFLAGS) -o $@ $<

# Convert the ELF file into a raw binary image
$(TARGET): $(ELF)
	$(OBJCOPY) -O binary $< $@

# Clean up generated files
clean:
	rm -f $(OBJECT) $(ELF) $(TARGET)

# ...
run: $(TARGET)
	$(QEMU)  -drive 'file=$(TARGET),format=raw' -serial mon:stdio -smp 2

# Phony targets
.PHONY: all clean