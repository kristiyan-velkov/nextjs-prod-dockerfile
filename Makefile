# Variables
IMAGE_NAME = nextjs-app
CONTAINER_NAME = nextjs-container
HOST_PORT = 3000
CONTAINER_PORT = 80
DOCKERFILE = Dockerfile

# Default target
.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make build          - Build the Docker image"
	@echo "  make run            - Run the Docker container"
	@echo "  make build-run      - Build and run the Docker container"
	@echo "  make stop           - Stop the Docker container"
	@echo "  make restart        - Restart the Docker container"
	@echo "  make logs           - Show container logs"
	@echo "  make clean          - Remove Docker image and container"

# Build the Docker image
build:
	docker build -f $(DOCKERFILE) -t $(IMAGE_NAME) .

# Run the Docker container
run:
	@docker rm -f $(CONTAINER_NAME) 2>/dev/null || true
	docker run --name $(CONTAINER_NAME) -p $(HOST_PORT):$(CONTAINER_PORT) $(IMAGE_NAME)

# Build and run the Docker container in one step
build-run: build run

# Stop the Docker container
stop:
	docker stop $(CONTAINER_NAME)

# Restart the Docker container
restart: stop run

# Show logs from the Docker container
logs:
	docker logs -f $(CONTAINER_NAME)

# Clean up by removing Docker image and container
clean:
	-docker rm -f $(CONTAINER_NAME)
	-docker rmi $(IMAGE_NAME)

# Clean up by removing Docker container
clean-container:
	docker rm -f $(CONTAINER_NAME)

# Clean up by removing Docker image and container
clean-image:
	docker rmi $(IMAGE_NAME)