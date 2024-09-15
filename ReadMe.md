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

- [Ansible Playbook](#ansible-playbook)

- [Terraform](#terraform)

- [Kubernetes](#Kubernetes)


## Folder Structure

```
├── ansible
│   ├── ansible.cfg
│   ├── hosts.ini
│   └── site.yml
├── docker-compose.yml
├── Dockerfile
├── Jenkinsfile
├── Kubernetes
│   ├── deployment.yml
│   ├── ingress.yml
│   ├── limits.yml
│   ├── namespace.yml
│   ├── pod.yml
│   └── service.yml
├── nginx.conf
├── ReadMe.md
├── requirements.txt
├── static
│   └── clockimage.jpg
├── task.py
├── templates
│   └── index.html
├── Terraform
│   ├── main.tf
└── test_task.py
```
## Description

- **`ansible/`**: Contains Ansible configuration and playbooks for deploying and managing infrastructure.

  - **`ansible.cfg`**:Configuration file for Ansible.

  - **`hosts.ini`**: Inventory file listing the hosts managed by Ansible.

  - **`site.yml`**:Ansible playbook for deploying and managing the application
- **`docker-compose.yml`**: Docker Compose configuration file.
- **`Dockerfile`**: Dockerfile for building the Flask application image.
- **`Jenkinsfile`**:The Jenkins pipeline for continuous integration and delivery (CI/CD).
- **`Kubernetes/`**: Contains Kubernetes manifests for deploying and managing resources in a Kubernetes cluster.
  - **`deployment.yml`**: Deployment configuration for the application.
  - **`ingress.yml`**: Ingress rules for managing external access to the services.
  - **`limits.yml`**: Resource limits and requests for Kubernetes pods.
  - **`namespace.yml`**: Kubernetes namespace configuration.
  - **`pod.yml`**: Pod configuration for the application.

  - **`service.yml`**: Service configuration for exposing the application.
- **`nginx.conf`**: Nginx configuration file.
- **`ReadMe.md`**: Markdown file providing project information (this file).
- **`requirements.txt`**: List of Python dependencies for the Flask application.
- **`static/`**:Directory containing Image for the Flask application
- **`task.py`**: Main Python file containing the Flask application code.
- **`templates/`**: Directory containing HTML templates for the Flask application.
  - **`main.tf`**:Main Terraform configuration file.
- **`test_task.py`**: Python script with tests for the Flask application.

## Prerequisites
Before running the application, ensure you have the following installed:
   -  Python 3.11
   -  Flask 2.0.2 (install via pip install Flask)
   -  Docker
   -  Jenkins
   -  Ansible
   -  Terraform
   -  minikube
   -  kubectl

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

    # Test docker 
    sudo groupadd docker
    docker run hello-world
    ```  
6. install ansible
    ```bash
    sudo apt update
    sudo apt install ansible
    ansible-galaxy collection install community.docker
    ```
7. install terraform
    ```bash
    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install terraform
    ```
8. Install minikube
    ```bash
    # Install on linux
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

    sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

    # start your cluster
        minikube start

    # check version
        minikube version
    ## Result ##
    minikube version: v1.34.0
    commit: 210b148df93a80eb872ecbeb7e35281b3c582c61
    ```
9. Install kubectl 
    ```bash
    # Install on linux
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

    echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

    # check version
    kubectl version --client
    ## Result ##
    Client Version: v1.31.0
    Kustomize Version: v5.4.2
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
7. install Jenkins
    ```bash
    sudo apt update
    sudo apt upgrade
    sudo apt install openjdk-17-jre
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
    
    # Test java installed

    java --version

    sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt update
    sudo apt install jenkins

    # test jenkins insalled

    jenkins --version
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

1. Create AWS account & Sign In
    ```bash
    https://aws.amazon.com/
   ```
2. Create EC2 instence

3. Security Groups Rules
    ```bash
    1. SSH : 22
    2. HTTP: 80
    3. Custom rule: 8080
   ```

4. Create Key_Pair

    Download the .pem file

5. Connect SSH client:
    ```bash
    sudo chmod 400 ./labsuser.pem

    ssh -i ./labsuser.pem ubuntu@ec2-3-87-37-229.compute-1.amazonaws.com
    ```

6. Run Jenkins on :
    ```bash
    ec2-3-87-37-229.compute-1.amazonaws.com:8080
    ```
7. Run command to get password
    ```bash
    sudo cat /var/lib/jenkins/secrets/initialAdminPassword
    ```
    
8. Create a job


## Ansible Playbook

- Run file (site.yml)
```bash
    ansible-playbook -i hosts.ini site.yml
```
- Screenshot for the successful run (local host)

    ![ansible](https://github.com/user-attachments/assets/98906173-1cf4-4529-a091-e748a12718ff)

## Terraform:

- Create instance using terraform
    ```bash
    cd Terraform

    terraform init

    terraform plan

    terraform apply
    ```

- Connect to instance
    ```bash
    cd ansible 

    sudo chmod 400 ./labsuser.pem

    ssh -i ./labsuser.pem ubuntu@ec2-3-88-11-121.compute-1.amazonaws.com
    ```

- Run an ansible playbook (EC2 instance):
    ```bash
    ansible-playbook -i hosts.ini site.yml
    ```
- Screenshot for the successful run
  ![ans_terr_1](https://github.com/user-attachments/assets/be7ef057-dd5a-4549-88f2-89b4753be5fe)
  
  ![ans_terr_2](https://github.com/user-attachments/assets/9b21f131-abdc-4124-96f5-eb3deb7e36f1)

- Run app against EC2 instance 
  Link ---> http://ec2-18-207-161-212.compute-1.amazonaws.com/

  ![Run_app_against_EC2_instance](https://github.com/user-attachments/assets/1612a449-146d-47f9-9778-c90779a4be83)

## Kubernetes:

### Deployment My application:

1. Start Minkube:
    ```bash
    # Ensure Docker Running
    sudo systemctl start docker

    # start minikube
    minikube start
    ```

2. Create the namespace:
```bash
    kubectl apply -f namespace.yml
```

3. Apply the LimitRange:
```bash
    kubectl apply -f limits.yml
```

4. Deploy the application:
```bash
    kubectl apply -f deployment.yml
```

5. Create the service:
```bash
    kubectl apply -f service.yml
```

6. Set up ingress:
```bash
    kubectl apply -f ingress.yml
```
- Screenshot for K8s_Dashboard:
  ![k8s_dashbord](https://github.com/user-attachments/assets/8cfc52f9-9702-41b6-a280-5132e6c4ca6e)

### Access the app via service:
```bash
    minikube service time-svc 
```
#### Run app on link --> http://192.168.49.2:30090
![K8s_app](https://github.com/user-attachments/assets/be16f31f-0516-4df8-890b-04ea450068e9)





