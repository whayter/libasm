NAME		=	libasm.a

SRC			=	ft_strlen.s	\
				ft_strcpy.s \
				ft_strcmp.s \
				ft_write.s	\
				ft_read.s	\
				ft_strdup.s \

SRC_DIR		=	srcs
TMP_DIR		=	tmp

FLAGS		=	-Wall -Wextra -Werror
RM			=	rm -rf
EXEC		=	a.out
NA			=	nasm
M_OUT		=	-f macho64
L_OUT		=	-f elf64

SRCS		=	$(addprefix $(SRC_DIR)/,$(SRC))
OBJS		=	$(addprefix $(TMP_DIR)/,$(SRC:.s=.o))

all: 			$(NAME)

$(TMP_DIR)/%.o:	$(SRC_DIR)/%.s
	@mkdir -p $(TMP_DIR)
	@($(NA) $(L_OUT) -o $@ -s $<)

$(NAME):		$(OBJS)
	@echo "Compiling..."
	@(ar rcs $(NAME) $(OBJS))
	@echo "Done."

test:			$(NAME)
	@(clang main.c $(TMP_DIR)/*.o)

clean:
	@echo "Cleaning..."
	@(rm -rf $(TMP_DIR))
	@echo "Done."

fclean:			clean
		@echo "Fcleaning..."
		@($(RM) $(EXEC))
		@($(RM) $(NAME))
		@echo "Done."

re:	fclean all

.PHONY:	all test clean fclean re