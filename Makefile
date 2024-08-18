CC = gcc

TARGET = RayLibTest

SRC = RayLibTest.c

CFLAGS = -Wall -std=c99 -Iraylib/include

# OSごとのリンクオプションを設定
ifeq ($(OS),Windows_NT)
    LDFLAGS = -Lraylib/lib -lraylib -lopengl32 -lgdi32 -lwinmm
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        LDFLAGS = -Lraylib/lib -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
    endif
endif

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC) $(LDFLAGS)

clean:
	rm -f $(TARGET)
