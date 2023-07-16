NAME = Sully
# NAME_T = test

OBJ_DIR		=	objs
INC_DIR		=	includes
SRC_DIR		=	$(shell find srcs -type d)

CXX	= clang
CXXFLAGS = -Wall -Wextra -Werror

ifeq ($(DEBUG), 1)
	CXXFLAGS += -g3
endif

SRC = main.c
OBJS = $(addprefix $(OBJ_DIR)/, $(SRC:%.c=%.o))

vpath %.c $(foreach dir, $(SRC_DIR), $(dir):)


all : $(NAME)

$(NAME) : $(OBJS)
	$(CXX) ${CXXFLAGS} -I${INC_DIR} ${OBJS} -o $@

# $(OBJ_DIR)/%.o: %.s | $(OBJ_DIR)
# 	$(CMD_AS) ${FLAG_AS} -o $@ $<

# --  Redirection in OBJS  -- #
$(OBJ_DIR)/%.o: %.c | $(OBJ_DIR)
	$(CXX) ${CXXFLAGS} -I${INC_DIR} -o $@ -c $<

$(OBJ_DIR) :
	@mkdir -p $@

# ${NAME_T} : $(NAME) ${OBJS_TEST}
# 	$(CXX) ${CXXFLAGS} ${OBJS_TEST} -I${INC_DIR} -o $(NAME_T) -L. -lasm -fPIC -pie

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME) ${NAME_T}


re: fclean all

.PHONY: re fclean clean all