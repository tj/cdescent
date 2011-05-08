
CC ?= gcc

SRC = src/cdescent.c \
			src/compile.c \
			src/tree.c

OBJ = $(SRC:.c=.o)

CFLAGS = -c -03

bin/cdescent: $(OBJ)
	@mkdir -p bin
	$(CC) $^ $(LDFLAGS) -o $@

%.o: %.c
	$(CC) $< $(CFLAGS) -o $@

clean:
	rm -fr bin src/*.o

.PHONY: clean