SRC =		src/memcpy.asm \
			src/memset.asm \
			src/strcasecmp.asm \
			src/strcmp.asm \
			src/strncmp.asm \
			src/memmove.asm \
			src/rindex.asm \
			src/strchr.asm \
			src/strlen.asm

CC =			ld

ASM =			nasm

RM =			rm -f

NAME =			libasm.so

OBJ =			$(SRC:.asm=.o)

CFLAGS =		-nostdlib -shared -fPIC

ASMFLAGS =		-f elf64

%.o: %.asm
			$(ASM) $(ASMFLAGS) -o $@ $<

all:			$(NAME)

$(NAME):		$(OBJ)
			$(CC) $(CFLAGS) $(OBJ) -o $(NAME)

clean:
			$(RM) $(OBJ)

fclean:			clean
			$(RM) $(NAME)

re:			fclean all

.PHONY: all clean fclean re
