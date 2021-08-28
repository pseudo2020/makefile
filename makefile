CC:=cc
CC_FLAGS:=-g -Wall -std=c90 -pedantic
LD_FLAGS:=

BIN:=bin
SRC:=src
OBJ:=obj
SRCS=$(wildcard $(SRC)/*.c)
OBJS=$(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SRCS))

all: $(BIN)

$(BIN): $(OBJS) $(OBJ)
	$(CC) $(CC_FLAGS) $(OBJS) -o $@ $(LD_FLAGS)

$(OBJ)/%.o: $(SRC)/%.c $(OBJ)
	$(CC) $(CC_FLAGS) -c $< -o $@

$(OBJ):
	mkdir -p $@

run: all
	./$(BIN)

clean:
	rm -r $(OBJ)
	rm $(BIN)

.PHONY: all, run, clean
