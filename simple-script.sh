#!/bin/bash
# simple-script.sh

echo "Hello from the CI/CD pipeline!"
echo "This build was executed at: $(date)"
echo "Running some sample tests..."
echo "I am adding new line instead of eexisting one"
# Simulate some test being run
sleep 2
echo "Test 1: PASSED"
sleep 1
echo "Test 2: PASSED"
sleep 1
echo "Test 3: PASSED"

echo "Build completed successfully!"