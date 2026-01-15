# Compiler and flags
CC := $(CROSS_COMPILE)gcc
CFLAGS := -Wall -Werror

# Target executable
TARGET := writer
SRC := writer.c
OBJ := $(SRC:.c=.o)

# Default target
all: $(TARGET)

# Build the application
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

# Compile object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean target
clean:
	rm -f $(TARGET) *.o
