
SRC = src/cdescent.c \
			src/compile.c \
			src/tree.c

bin/cdescent:
	@mkdir -p bin
	$(CC) -03 $(SRC) -o $@