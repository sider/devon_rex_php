build:
	docker build -t quay.io/actcat/devon_rex_php:dev .

test:
	docker run -it --rm quay.io/actcat/devon_rex_php:dev bash -c "php -v"
