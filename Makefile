HERE = $(shell pwd)
BIN = $(HERE)/bin
PYTHON = $(BIN)/python

INSTALL = $(BIN)/pip install --no-deps
BUILD_DIRS = bin build include lib lib64 man share


.PHONY: all test build clean docs

all: build

$(PYTHON):
	virtualenv-3.5 $(VTENV_OPTS) .

build: $(PYTHON)
	$(PYTHON) setup.py develop
	$(BIN)/pip install tox

clean:
	rm -rf $(BUILD_DIRS)

test: build
	$(BIN)/tox

docs:  build
	$(BIN)/tox -e docs
