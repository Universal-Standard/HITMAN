#!/bin/bash

# Create a virtual environment
python3 -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Install the required packages
pip install -r requirements.txt

# Install dev dependencies
pip install -e .[dev]

# Set up pre-commit hooks
pre-commit install

# Run tests
pytest tests/

# Build documentation
cd docs
make html

# New setup steps
echo "Running new setup steps..."
# Add any new setup steps here

# New test steps
echo "Running new test steps..."
# Add any new test steps here

# New build steps
echo "Running new build steps..."
# Add any new build steps here
