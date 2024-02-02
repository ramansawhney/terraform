resource "aws_instance" "web" {
  count         = terraform.workspace == "dev" ? 3 : terraform.workspace == "uat" ? 2 : 1
  ami           = var.ami
  instance_type = terraform.workspace == "dev" ? "t2.nano" : terraform.workspace == "uat" ? "t2.micro" : "t2.small"
  tags          = { Name = "${var.tags.Name}-${terraform.workspace}-${count.index}" }
  key_name      = aws_key_pair.key.key_name

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> myfile.txt"
  }
}

resource "aws_key_pair" "key" {
  key_name   = "${var.tags.Name}-${terraform.workspace}-raman-kp"
  public_key = file("/root/.ssh/id_rsa.pub")
}
