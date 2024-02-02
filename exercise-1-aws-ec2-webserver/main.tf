
resource "aws_instance" "web" {
  ami             = var.ami
  instance_type   = var.instance_type
  tags            = var.tags
  key_name        = aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.my-sg.id]
  user_data       = file("${path.module}/install-httpd.sh")
}


resource "aws_key_pair" "key" {
  key_name   = "${var.tags.Name}-raman-kp"
  public_key = file("/root/.ssh/id_rsa.pub")
}

resource "aws_security_group" "my-sg" {
  name        = "my-ec2-sg"
  description = "For ec2 traffic inbound and outbound"

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
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

