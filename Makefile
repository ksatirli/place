# Makefile for Place

### configuration
MAKEFLAGS=--no-builtin-rules --warn-undefined-variables
SHELL := sh

.DEFAULT_GOAL := help
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c

include make/*.mk

.PHONY: all
all:
	@echo

.PHONY: clean
clean:
	@echo

.PHONY: test
test:
	@echo
