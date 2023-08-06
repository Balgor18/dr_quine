NAME_C = Sully_C
NAME_ASM = Sully_ASM

OBJ_DIR_C	=	objs_c
INC_DIR		=	includes
SRC_DIR_C	=	$(shell find C -type d)

OBJ_DIR_ASM	=	objs_asm
SRC_DIR_ASM	=	$(shell find ASM -type d)

CXX			= clang
CXXFLAGS	= -Wall -Wextra -Werror

LINKER		= ld
LINKER_FLAG	= -arch x86_64
CMD_AS		= nasm

ifeq ($(shell uname), Darwin)
	FLAG_AS			= -f macho64
	LINKER_FLAG		= -arch x86_64 -macosx_version_min 13.0 -L/Library/Developer/CommandLineTools/SDKs/MacOSX13.sdk/usr/lib -lSystem
else ifeq ($(shell uname), Linux)
	FLAG_AS		= -f elf64
	LINKER_FLAG	= -no-pie -lc
endif

ifeq ($(DEBUG), 1)
	CXXFLAGS += -g3
endif

SRC_C = Sully.c
OBJS_C = $(addprefix $(OBJ_DIR_C)/, $(SRC_C:%.c=%.o))
vpath %.c $(foreach dir, $(SRC_DIR_C), $(dir):)

SRC_ASM = Sully.s
OBJS_ASM = $(addprefix $(OBJ_DIR_ASM)/, $(SRC_ASM:%.s=%.o))
vpath %.s $(foreach dir, $(SRC_DIR_ASM), $(dir):)

all : $(NAME_C) ${NAME_ASM}

$(NAME_ASM) : $(OBJS_ASM)
	$(CXX) ${OBJS_ASM} -o $@ ${LINKER_FLAG}

$(NAME_C) : $(OBJS_C)
	$(CXX) ${CXXFLAGS} -I${INC_DIR} ${OBJS_C} -o $@

$(OBJ_DIR_ASM)/%.o: %.s | $(OBJ_DIR_ASM)
	$(CMD_AS) ${FLAG_AS} -o $@ $<

# --  Redirection in OBJS  -- #
$(OBJ_DIR_C)/%.o: %.c | $(OBJ_DIR_C)
	$(CXX) ${CXXFLAGS} -I${INC_DIR} -o $@ -c $<

$(OBJ_DIR_C) :
	@mkdir -p $@

$(OBJ_DIR_ASM) :
	@mkdir -p $@

clean:
	rm -rf ${OBJ_DIR_C} ${OBJ_DIR_ASM}

fclean: clean
	rm -f $(NAME_C) ${NAME_ASM} Sully_*

re: fclean all

.PHONY: re fclean clean all