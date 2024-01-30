resource "aws_instance" "web" {
  for_each = { dev = "t2.nano", uat = "t2.micro", prd = "t2.small" }
  ami           = var.ami
  instance_type = each.value
  tags          = { Name= "${var.tags.Name}-${each.key}" }
  key_name      = aws_key_pair.key.key_name

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> myfile.txt"
  }
}

resource "aws_key_pair" "key" {
  key_name   = "${var.tags.Name}-raman-kp"
  public_key = file("/root/.ssh/id_rsa.pub")
}
