[![Python test](https://github.com/SH-code12/DevOps_task/actions/workflows/pytest.yml/badge.svg)](https://github.com/SH-code12/DevOps_task/actions/workflows/pytest.yml)

[![CI With GitHub Actions](https://github.com/SH-code12/DevOps_task/actions/workflows/action.yml/badge.svg)](https://github.com/SH-code12/DevOps_task/actions/workflows/action.yml)

# Show Current Time

A simple web application show current time using flask

## Table of content

- [Folder Structure](#folder-structure)

- [Description](#description)

- [Prerequisites](#prerequisites)

- [Instullation](#instullation)

- [Install Dependencies](#install-dependencies)

- [Testing](#testing)

- [Usage](#usage)

- [Build Docker Image](#build-the-docker-image)

- [Run Docker Contaniner](#run-the-docker-container)

- [Run app with nginx](#Run-app-with-an-nginx-webserver)

- [Jenkins server in an EC2 instance](#Jenkins-server-in-an-EC2-instance)


## Folder Structure

```
├── docker-compose.yml
├── Dockerfile
├── Jenkinsfile
├── nginx.conf
├── ReadMe.md
├── requirements.txt
├── static
│   └── clockimage.jpg
├── task.py
├── templates
│   └── index.html
└── test_task.py
```
## Description

- **`docker-compose.yml`**: Docker Compose configuration file.
- **`Dockerfile`**: Dockerfile for building the Flask application image.
- **`Jenkinsfile`**:The Jenkins pipeline for continuous integration and delivery (CI/CD).
- **`nginx.conf`**: Nginx configuration file.
- **`ReadMe.md`**: Markdown file providing project information (this file).
- **`requirements.txt`**: List of Python dependencies for the Flask application.
- **`static/`**:Directory containing Image for the Flask application
- **`task.py`**: Main Python file containing the Flask application code.
- **`templates/`**: Directory containing HTML templates for the Flask application.
- **`test_task.py`**: Python script with tests for the Flask application.


## Prerequisites
Before running the application, ensure you have the following installed:
   -  Python 3.11
   -  Flask 2.0.2 (install via pip install Flask)
   - Docker

## Instullation
To get started with the Flask Application, follow these steps:
## Steps
1. install python in your machine
    ```bash
    sudo apt update
    sudo apt install python3.11
    ```
2. check if python is installed
    ```bash
    python3 --version
    ```
3. create virtualenv
    ```bash
    sudo apt install python3.11-venv
    python3 -m venv venv
    ```
4. activate virtualenv
    ```bash
    source venv/bin/activate
    ```
5. install Docker
    ```bash
    sudo apt-get update
    sudo apt install docker.io docker-compose docker-buildx
    ```
6. test docker 
    ```bash
    sudo groupadd docker
    docker run hello-world
    ```    


## Install Dependencies:
5. install flask
    ```bash
    pip install Flask
    ```
6. install required packages listed
    ```bash
    pip install -r requirements.txt
    ```

## Testing

- Run the test to ensure functions work correctly
    ```bash
    python test_task.py
    ```

## Usage
7. Run the application
    ```bash
    python3 task.py
    ```
The application will be accessible at The application will be accessible a http://127.0.0.1:5000


## Build the Docker Image

```bash
docker build -t shahdelnassag/dev-task . 
```
## Run the Docker Container
```bash
ocker run -p5000:5000 shahdelnassag/dev-task
```
The application will be accessible at http://127.0.0.1:5000

link Image: [DockerHub](https://hub.docker.com/layers/shahdelnassag/dev-task/v1.0.0/images/sha256-1a4347be4b2fcb04dba97460d6e9d972fbe483e046163cff6a05f0764ca1139a?context=repo)

## Run app with an nginx webserver:
```bash
docker-compose up --build
```

The app will running on : http://127.0.0.1:5000 OR http://172.18.0.2:5000

## Jenkins server in an EC2 instance
This pipeline ensures that your application is built, packaged into a Docker container, and then deployed, allowing continuous integration and delivery.
```

1. Clone the repository from GitHub.

2. Build a Docker image from the cloned repository.

3. Stop and remove any existing Docker container named test-container.

4. Run a new Docker container named test-container from the built Docker image, exposing it on port 5000.
```


