#!/bin/bash

# Generate a unique name for a container based on a random string
generate_unique_name() {
  echo "container-$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 10)"
}

# Set the container names dynamically
export SENTINEL_CONTAINER_NAME=$(generate_unique_name)
export SLAVE_CONTAINER_NAME=$(generate_unique_name)

# Run the actual Docker Compose command
docker-compose up -d --scale sentinel=3 --scale slave=2
