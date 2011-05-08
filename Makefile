
CC ?= gcc

SRC = src/parser.c \
			src/compile.c \
			src/tree.c

OBJ = $(SRC:.c=.o)

CFLAGS = -c -03

bin/cdescent: $(OBJ)
	@mkdir -p bin
	$(CC) $^ $(LDFLAGS) -o $@

src/parser.c: src/parser.leg
	./bin/cdescent < $< > $@

%.o: %.c
	$(CC) $< $(CFLAGS) -o $@

clean:
	rm -fr bin src/*.o

.PHONY: clean