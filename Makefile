ifeq ($(GOBIN),)
GOBIN := $(GOPATH)/bin
endif

clean:
	go clean

dependencies:
	go get -u github.com/smartystreets/goconvey/convey
	go get -u github.com/golang/lint/golint
	go get -u github.com/kardianos/govendor
	$(GOBIN)/govendor sync

build:
	go build

check:
	go vet ./...
	golint ./...

test: check
	go test ./...

ci: clean dependencies build test

default: build

.PHONY: test
