# Makefiles By Example

The basic structure of a Makefile is as follows:

```Makefile
dependency-one:
    command1
    command2

dependency-two:
    command3

end-goal: dependency-one dependency-two
    command4
    command5
    # ...
    commandN
```

When you invoke `make end-goal`, the following would happen:

* dependency-one (command1, command2)
* dependency-two (command3)
* end-goal (command4, command5, commandN)

## Basic stuff

### `#`
Everything after it is a comment, until the next line break.

### `:=`, `=` and `?=`
These are different ways of setting values to variables.
```Makefile
START_TIME := $(shell date)
CURRENT_TIME = $(shell date)
ENABLED ?= no
```

### `$(VAR)`
Returns the value of the variable `VAR`.
```Makefile
VIM_DIR := $(HOME)/.vim
```

### `@`
Do not echo the command that follows.
```Makefile
ninja:
    @echo ""
```

### `%`, `$*` and `$@`
```Makefile
say-my-name-%:
	@echo Given the target $@, your name is $*!
```

* `$@` to represent the full target name of the current target
* `$*` returns the text that corresponds to % in the target

## Special variables

### `SHELL`
Defines the shell program to interpret each goal. Defaults to `/bin/sh`
```Makefile
SHELL = /bin/bash
```

### `.DEFAULT_GOAL`
```Makefile
.DEFAULT_GOAL = my-second-goal
```

### `.PHONY:`
The definitions that follows it should not be interpreted as files.
```Makefile
.PHONY: release-major release-minor release-patch
release-major:
	$(XYZ) --increment major
release-minor:
	$(XYZ) --increment minor
release-patch:
	$(XYZ) --increment patch
```

## Helper functions

## `shell`
Executes a shell command and return its output.
```Makefile
NOW = $(shell date)
```

## `define` and `call`
```Makefile
define print_title
echo -----------------
echo $(1)
echo -----------------
endef

main-menu:
	@$(call print_title,"main menu")
```

## `ifndef` and `error`
```Makefile
PIP3 := $(shell command -v pip3 2> /dev/null)
ifndef PIP3
define MSG
PIP3 does not seem to be installed.
To install it, follow the instructions found at this website:

	https://pip.pypa.io/en/stable/installing/

endef
$(error $(MSG))
endif
```
