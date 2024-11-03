# Define target names
EXECUTABLE_PC = ShadedTriangle_PC

# Source files
SRC = main.c

# PC build settings
CC_PC = gcc
CFLAGS_PC = -Wall -O2 -std=c99
LDFLAGS_PC = -lSDL2 -lGLESv2

# Default target builds both PC and Vita executables
all: $(EXECUTABLE_PC)

# PC build rules
$(EXECUTABLE_PC): main_pc.o
	$(CC_PC) main_pc.o $(LDFLAGS_PC) -o $@

main_pc.o: $(SRC)
	$(CC_PC) $(CFLAGS_PC) -c $< -o $@

# Clean target for removing generated files
clean:
	rm -f *.o $(EXECUTABLE_PC)
