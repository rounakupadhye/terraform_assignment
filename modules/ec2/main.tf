resource "aws_instance" "ec2-instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = aws_key_pair.generated_public_key.key_name
  tags = {
    Name = "public-ec2"   
  }
  
  vpc_security_group_ids = [var.vpc_security_group_id]
  associate_public_ip_address = true 
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_public_key" {
  key_name   = var.key_name
  public_key = tls_private_key.private_key.public_key_openssh

    provisioner "local-exec" { # Create "private-key.pem" to your machine
    command = "echo '${tls_private_key.private_key.private_key_pem}' > ./private-key.pem"
  } 
}