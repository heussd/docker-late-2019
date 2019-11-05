present:
	reveal-md Readme.md -w --theme ./reveal-style-th.css

submodule:
	git submodule update --init --remote --recursive

install: submodule
	npm install -g reveal-md

