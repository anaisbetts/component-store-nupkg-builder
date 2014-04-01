.PHONY: clean pack all

all: clean pack

clean:
	rm -rf ./target

pack:
	cat ./package.list | xargs -L 1 ./script/create-package.sh
