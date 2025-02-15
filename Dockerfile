# Use an official Python runtime as the base image
FROM python:3.11.3

# Install necessary system packages
RUN apt-get update && \
    apt-get install -y bash nano vim

# Set the working directory in the container
WORKDIR /app

# Copy the project files into the container
COPY . /app

# Ensure requirements.txt exists, then install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8080 for Flask
EXPOSE 8080

# Set environment variables for Flask
ENV FLASK_APP=server.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=8080

# Default command to run the application
CMD ["flask", "run"]
