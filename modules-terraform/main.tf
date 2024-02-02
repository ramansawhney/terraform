resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  tags          = var.tags
  key_name      = aws_key_pair.key.key_name
}

resource "aws_key_pair" "key" {
  key_name   = "${var.tags.Name}-raman-kp"
  public_key = file("/root/.ssh/id_rsa.pub")
}
