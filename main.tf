provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "pmm_sg" {
  name        = "pmm-sg"
  description = "Allow SSH and PMM ports"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
  from_port   = 8443
  to_port     = 8443
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

resource "aws_instance" "pmm_server" {
  ami           = var.ami_id
  instance_type = "t3.medium"
  key_name      = var.key_name
  security_groups = [aws_security_group.pmm_sg.name]

  root_block_device {
    volume_size = 20            
    volume_type = "gp3"         
    delete_on_termination = true
  }

  tags = {
    Name = "PMM-Server"
  }
}

resource "aws_instance" "pmm_client" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  key_name      = var.key_name
  security_groups = [aws_security_group.pmm_sg.name]

  root_block_device {
    volume_size = 20           
    volume_type = "gp3"         
    delete_on_termination = true
  }

  tags = {
    Name = "PMM-Client"
  }
}
