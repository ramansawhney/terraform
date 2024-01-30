resource "aws_instance" "web" {
  count = "${var.env == "dev" ? 1 : var.env == "uat" ? 2 : 3}"
  ami           = var.ami
  instance_type = "${var.env == "dev" ? "t2.small" : var.env == "uat" ? "t2.micro" : "t2.nano"}"
  tags          = { Name= "${var.tags.Name}-${count.index}" }
  key_name      = aws_key_pair.key.key_name

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> myfile.txt"
  }
}

resource "aws_key_pair" "key" {
  key_name   = "${var.tags.Name}-raman-kp"
  public_key = file("/root/.ssh/id_rsa.pub")
}
