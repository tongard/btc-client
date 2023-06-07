RELEASE := 'v23.06'
RELEASESEM := 'v1.3.1'

all: build

build:
	docker-compose build

run:
	docker-compose up -d

tag-version:
	git diff --exit-code && git diff --staged --exit-code && git tag -a $(RELEASE) -m 'Release $(RELEASE)'
	git tag -a $(RELEASESEM) -m 'Release $(RELEASE)' || (echo "Repo is dirty please commit first" && exit 1)


.PHONY: all build run tag-version