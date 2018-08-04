.PHONY: all
all: build

dist:
	mkdir dist

dist/y2j: dist $(wildcard y2j/main.go)
	go build -o $@ ./y2j 

dist/j2y: dist $(wildcard y2j/main.go)
	go build -o $@ ./j2y 

.PHONY: build 
build: dist/j2y dist/y2j
