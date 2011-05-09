
CC ?= gcc

PREFIX = /usr/local

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

install: bin/cdescent
	cp -f $< $(PREFIX)/$<

uninstall:
	rm -f $(PREFIX)/bin/cdescent

clean:
	rm -fr bin src/*.o

test: bin/cdescent
	./$< examples/switch.g > examples/switch.c \
		&& $(CC) examples/switch.c -o examples/switch \
		&& ./examples/switch

.PHONY: test clean install uninstall