include $(DEVKITPRO)/libctru/3ds_rules

TARGET := nosleep
BUILD := build
SOURCE := source
DATA := data
INCLUDE := include
LIBS := 

.PHONY: all clean

all:
	@$(MAKE) -C $(BUILD) -f ../Makefile

clean:
	rm -rf $(BUILD) $(TARGET).3dsx $(TARGET).elf

$(BUILD)/main.o: source/main.c
	mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET).3dsx: $(BUILD)/main.o
	$(LINK) $(LDFLAGS) -o $(TARGET).elf $^ $(LIBS)
	3dsxtool $(TARGET).elf $(TARGET).3dsx --smdh=nosleep.smdh
