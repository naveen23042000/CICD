#!/bin/bash

echo "Hello from Jenkins CI/CD pipeline!"
echo "Build executed at $(date)"
echo "Build number: $BUILD_NUMBER"

# Simulate some work
echo "Performing task 1..."
sleep 2
echo "Performing task 2..."
sleep 1
echo "All tasks completed successfully."