#!/bin/sh

# Start the Docker daemon
dockerd &
DOCKERD_PID=$!

# Wait for the Docker daemon to start
sleep 5

# Check if the Docker daemon is running
if ps -p $DOCKERD_PID > /dev/null; then
  # Start Docker Compose services
  docker compose up
else
  echo "Failed to start Docker daemon"
  exit 1
fi