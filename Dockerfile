# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the source code and tests into the container
COPY src/ ./src
COPY tests/ ./tests

# Run tests (assuming you are using pytest)
RUN pytest 

# Set the default command to execute your Python script if tests pass
CMD ["python", "src/calculate.py"]
