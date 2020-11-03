.SUFFIXES:

.DEFAULT_GOAL = say-my-name-Rafael
SHELL = /bin/bash

.PHONY: first-but-not-the-default-goal
first-but-not-the-default-goal:
	@echo this could be the default goal, but it\'s not

ENABLED ?= no

.PHONY: check-enabled
check-enabled:
	@echo checking enabled: $(ENABLED)

say-my-name-%:
	@echo Hello $*!

CURRENT_TIME = $(shell date)

check-time-twice:
	@echo current timestamp is $(CURRENT_TIME)
	@echo sleeping for one second...
	@$(shell sleep 1)
	@echo now the current timestamp is $(CURRENT_TIME)

define print_title
echo -----------------
echo $(1)
echo -----------------
endef

main-menu:
	@$(call print_title,"main menu")

foo:
	@echo $(MAKEFILE_LIST)
