.PHONY: setup test test-py test-ts test-php

setup:
	npm install
	composer install

test: test-py test-ts test-php

test-py:
	pytest -q

test-ts:
	npx vitest run

test-php:
	./vendor/bin/phpunit
