up: data/
	docker-compose up --build

data/:
	mkdir -p data/Sessions data/Users
	chmod -R 777 data/

.PHONY: up
