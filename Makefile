.PHONY: all
all: build

dist:
	mkdir dist

PLATFORMS := linux/amd64 darwin/amd64

temp = $(subst /, ,$@)
os = $(word 1, $(temp))
arch = $(word 2, $(temp))

$(PLATFORMS): dist
	GOOS=$(os) GOARCH=$(arch) go build -o 'dist/j2y-$(os)-$(arch)' ./j2y
	GOOS=$(os) GOARCH=$(arch) go build -o 'dist/y2j-$(os)-$(arch)' ./y2j

.PHONY: release 
release: $(PLATFORMS)

.PHONY: build 
build:
	go build -o dist/j2y ./j2y
	go build -o dist/y2j ./y2j
