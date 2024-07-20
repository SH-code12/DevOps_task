# Use the official Python image with Alpine Linux
FROM python:alpine

# Set working directory inside the container
WORKDIR /app

# Copy all files from current directory to /app in the container
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000
EXPOSE 5000

# Command to run the application
CMD ["python", "task.py"]
