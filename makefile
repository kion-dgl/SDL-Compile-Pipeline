# Source file
SRC = main.c

# Output directories
WEB_DIR = ./docs

# Target names
EXECUTABLE_PC = ShadedTriangle_PC
TARGET_WEB = $(WEB_DIR)/index.html

# Compiler and flags for PC build
CC_PC = gcc
CFLAGS_PC = -Wall -O2 -std=c99 -I/usr/include/SDL2
LDFLAGS_PC = -lSDL2 -lGLESv2

# Compiler and flags for WebGL (Emscripten) build
EMCC = emcc
CFLAGS_WEBGL = -s USE_SDL=2 -s FULL_ES2=1

# Default target builds only the Linux executable
all: linux

# Target to build both Linux and WebGL
all_targets: linux webgl

# PC build target
linux: $(EXECUTABLE_PC)

$(EXECUTABLE_PC): main_pc.o
	$(CC_PC) main_pc.o $(LDFLAGS_PC) -o $@

main_pc.o: $(SRC)
	$(CC_PC) $(CFLAGS_PC) -c $< -o $@

# WebGL build target
webgl: $(TARGET_WEB)

$(TARGET_WEB): $(SRC)
	mkdir -p $(WEB_DIR)
	$(EMCC) $(SRC) $(CFLAGS_WEBGL) -o $(TARGET_WEB)

# Clean target for removing generated files
clean:
	rm -f *.o $(EXECUTABLE_PC) $(TARGET_WEB) $(WEB_DIR)/triangle.wasm $(WEB_DIR)/triangle.js
