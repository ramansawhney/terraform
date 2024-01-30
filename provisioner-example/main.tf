resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  tags          = var.tags
  key_name      = aws_key_pair.key.key_name

  provisioner "local-exec" {
    command = "echo Public Ip is ${aws_instance.web.public_ip} > myfile.txt"
  }

  provisioner "local-exec" {
    # below is the way of getting public ip of instance with self coz we are already in ec2_instance 
    command = "echo putting the public ip with different way. Public  IP is ${self.public_ip} >> myfile.txt"
  }

  provisioner "local-exec" {
    command = "echo echo starting > myscript.sh ; echo sleep 20 >> myscript.sh ; echo echo Running >> myscript.sh ; echo sleep 20 >> myscript.sh ; echo echo Finishing >> myscript.sh"
  }

  provisioner "file" {
    source = "myscript.sh"
    destination = "/tmp/myscript.sh"
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("/root/.ssh/id_rsa")
      host = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 755 /tmp/myscript.shi",
      "echo STARTING REMOTE EXEC",
      "/bin/sh /tmp/myscript.sh",
      "echo REMOTE EXEC COMPLETED",
    ]
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("/root/.ssh/id_rsa")
      host = self.public_ip
    }
  }
}

resource "aws_key_pair" "key" {
  key_name   = "${var.tags.Name}-raman-kp"
  public_key = file("/root/.ssh/id_rsa.pub")
}
