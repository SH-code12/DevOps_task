# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Define the EC2 Instance resource
resource "aws_instance" "web_server" {
  #  count         = 3
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  key_name      = "vockey"
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]  # Associate the security group

  tags = {
    Name = "EC2_instance_SP2"
  }
}

# Define the Security Group resource
resource "aws_security_group" "web_server_sg" {
  name        = "EC2_instance_security_group_v3"
  description = "Security group for EC2 instance"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # HTTP access
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # SSH access
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Additional port access
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  }
}

# Output the public IP of the EC2 instance
output "instance_public_ip" {
  value = aws_instance.web_server.public_ip
}

# Output the public DNS of the EC2 instance
output "instance_public_dns" {
  value = aws_instance.web_server.public_dns
}
