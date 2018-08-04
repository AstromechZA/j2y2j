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

SHASUM_EXISTS := $(shell command -v shasum 2>/dev/null)

.PHONY: release 
release: $(PLATFORMS)
ifdef SHASUM_EXISTS
	shasum -a 256 dist/j2y-* > dist/SHA256SUMS
	shasum -a 256 dist/y2j-* >> dist/SHA256SUMS
else 
	sha256sum dist/j2y-* > dist/SHASHA256SUMSSUMS
	sha256sum dist/y2j-* >> dist/SHA256SUMS
endif

.PHONY: build 
build:
	go build -o dist/j2y ./j2y
	go build -o dist/y2j ./y2j
