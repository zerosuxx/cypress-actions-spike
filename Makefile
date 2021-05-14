default: help

.PHONY: test

help: ## Shows this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' -e 's/:.*#/: #/'

serve-native: ## Serve contents with php built in web server
	php -S localhost:8080 server.php

serve: ## Serve contents with docker
	docker-compose up -d app

down: ## Destroys the containers
	docker-compose down

pull: ## Downloads the images
	docker-compose pull

sh-cypress: ## Connects into cypress container
	docker-compose run --rm cypress /bin/bash

test: e2e ## Alias of e2e

e2e: ## Runs e2e tests with cypress
	docker-compose run --rm -T cypress make e2e-native

e2e-native: ## Runs e2e tests with cypress on host machine
	cd test/e2e && cypress run

e2e-browser: ## Runs e2e tests with cypress in browser
	-xhost +
	docker-compose run --rm -T cypress make e2e-browser-native

e2e-browser-native: ## Runs e2e tests with cypress in browser on host machine
	cd test/e2e && cypress open --project .
