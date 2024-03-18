##
## EPITECH PROJECT, 2024
## B-FUN-400-PAR-4-1-wolfram-guillaume.houriez
## File description:
## Makefile
##

NAME = wolfram
LOCAL_INSTALL_ROOT = $(shell stack path --local-install-root)

all:
	@stack build
	@cp $(LOCAL_INSTALL_ROOT)/bin/$(NAME) .

clean:
	@stack clean
	@echo 'Program cleaned'

fclean: clean
	@rm -f $(NAME)
	@echo 'Program purged'

re : fclean all

run :
	@./$(NAME)

tests_run:
	@stack test --coverage

.PHONY: all clean fclean re run tests_run
