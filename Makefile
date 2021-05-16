default: help

.PHONY: test

help: ## Shows this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' -e 's/:.*#/: #/'

up: ## Serve contents with docker
	docker-compose up -d

down: ## Destroys the containers
	docker-compose down

pull: ## Downloads the images
	docker-compose pull

sh: ## Connects into app container
	docker-compose run --rm app /bin/bash

sh-cypress: ## Connects into cypress container
	docker-compose run --rm cypress /bin/bash

install-ci: ## Installs application
	docker-compose run --rm app npm install

build-ci: ## Builds application
	docker-compose run --rm app npm run build

test: e2e ## Alias of e2e

test-ci: ## Runs tests in ci
	docker-compose run --rm app npm run test:unit
	docker-compose run --rm cypress make e2e-native-with-serve

e2e: ## Runs e2e tests with cypress
	docker-compose run --rm -T cypress make e2e-native

e2e-native: ## Runs e2e tests with cypress on host machine
	cd test/e2e && cypress run

e2e-native-with-serve: serve-native e2e-native ## Runs e2e tests with cypress and browser sync on host machine

e2e-browser: ## Runs e2e tests with cypress in browser
	-xhost +
	docker-compose run --rm -T cypress make e2e-browser-native

e2e-browser-native: ## Runs e2e tests with cypress in browser on host machine
	cd test/e2e && cypress open --project .

serve-native: ## Runs browser sync server in background
	npm run serve &
