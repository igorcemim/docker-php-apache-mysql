CONTAINER_NAME="localhost_app"

build:
	cd docker && docker build --no-cache -t $(CONTAINER_NAME) .

run:
	cd docker && docker-compose up --build

