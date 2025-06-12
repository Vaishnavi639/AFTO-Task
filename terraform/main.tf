provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "todo_server" {
  ami                    = "ami-03bb6d83c60fc5f7c"  
  instance_type          = "t2.micro"
  key_name               = "AFTO"    

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y docker.io docker-compose
              systemctl start docker
              systemctl enable docker
              sudo usermod -aG docker ubuntu
              EOF

  tags = {
    Name = "Flask-Todo-App"
  }

  vpc_security_group_ids = [aws_security_group.todo_sg.id]
}

resource "aws_security_group" "todo_sg" {
  name        = "todo-app-sg"
  description = "Allow HTTP & custom port"

  ingress {
    description = "Allow HTTP"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
  description = "Allow HTTP"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

ingress {
  description = "Allow HTTPS"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_ip" {
  value = aws_instance.todo_server.public_ip
}
