CC = /opt/devkitpro/devkitARM/bin/arm-none-eabi-gcc
CFLAGS = -O2 -Wall -mword-relocations -mtls-dialect=2 -I/opt/devkitpro/libctru/include -DARM11
LDFLAGS = -specs=3dsx.specs -L/opt/devkitpro/libctru/lib -lctru -lm

TARGET = nosleep
SRC = source/main.c
OBJ = $(SRC:.c=.o)

all: $(TARGET).3dsx

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET).elf: $(OBJ)
	$(CC) $(OBJ) $(LDFLAGS) -o $@

$(TARGET).3dsx: $(TARGET).elf
	3dsxtool $< $@ --smdh=nosleep.smdh

clean:
	rm -f $(OBJ) $(TARGET).elf $(TARGET).3dsx
