# Define the compiler
CC = clang

# Define the target executable
TARGET = bin/SimulatorGame

# Define the source files
SRC = src/main.m

# Define the frameworks to link against
FRAMEWORKS = -framework Cocoa -framework SpriteKit

# Build the target
$(TARGET): $(SRC)
	$(CC) -o $(TARGET) $(SRC) $(FRAMEWORKS)

# Clean the build
clean:
	rm -f $(TARGET)
