present:
	reveal-md Readme.md -w --theme ./reveal-style-th.css

submodule:
	git submodule update --init --remote --recursive

install: submodule
	npm install -g reveal-md

prepare:
	dot docker-vocabulary.graphviz -oimg/docker-vocabulary.svg -Tsvg

help:
	cat Makefile