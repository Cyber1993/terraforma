// Provider
provider "aws" {
  region     = "eu-north-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

// Create ec2 instance
resource "aws_instance" "EC2-Instance" {
  availability_zone      = "eu-north-1a"
  ami                    = "ami-0989fb15ce71ba39e"
  instance_type          = "t3.micro"
  key_name               = "sv111"
  vpc_security_group_ids = [aws_security_group.DefaultTerraformSG.id]

  // Create main disk
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 15
    volume_type = "standard"
    tags = {
      Name = "root-disk"
    }
  }

  // User script
  user_data = file("files/install.sh")

  // Tags
  tags = {
    Name = "EC2-Instance"
  }
}

// Create security group
resource "aws_security_group" "DefaultTerraformSG" {
  name        = "DefaultTerraformSG"
  description = "Allow 22, 80, 443 inbound taffic"

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
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
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
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
