FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install the required packages
RUN pip install -r requirements.txt

# Copy the project files
COPY . .

# Install dev dependencies
RUN pip install -e .[dev]

# Set up pre-commit hooks
RUN pre-commit install

# Run tests
RUN pytest tests/

# Build documentation
RUN cd docs && make html

# Install new dependencies
RUN apt-get update && apt-get install -y \
    new-dependency1 \
    new-dependency2

# Copy new files
COPY new_file1.txt /app/new_file1.txt
COPY new_file2.txt /app/new_file2.txt

# Expose new ports
EXPOSE 5555
EXPOSE 8080

# Set the entry point
ENTRYPOINT ["python", "run.py"]
