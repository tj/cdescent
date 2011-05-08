
CC ?= gcc

SRC = src/cdescent.c \
			src/compile.c \
			src/tree.c

OBJ = $(SRC:.c=.o)

bin/cdescent: $(OBJ)
	@mkdir -p bin
	$(CC) -03 $^ -o $@

%.o: %.c
	$(CC) $< -c -o $@

clean:
	rm -fr bin src/*.o

.PHONY: clean