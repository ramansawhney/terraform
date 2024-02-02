data "template_file" "example" {
  template = file("${path.module}/mydata")
}
#trimspace(data.template_file.example.rendered)

resource "aws_instance" "web" {
  count = "${ trimspace(data.template_file.example.rendered) == "dev" ? 1 : trimspace(data.template_file.example.rendered) == "uat" ? 2 : 3}"
  ami           = var.ami
  instance_type = "${ trimspace(data.template_file.example.rendered) == "dev" ? "t2.small" : trimspace(data.template_file.example.rendered) == "uat" ? "t2.micro" : "t2.nano"}"
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
