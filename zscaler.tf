resource "aws_instance" "zscaler_a" {

  ami           = var.zscaler_ami
  instance_type = "m5.large"
  subnet_id     = data.aws_subnet.private_a.id

  vpc_security_group_ids = [
    aws_security_group.zscaler_sg.id
  ]

  key_name = var.key_name

  user_data = file("${path.module}/userdata/bootstrap.sh")

  tags = {
    Name = "st-zscaler-az-a"
  }
}

resource "aws_instance" "zscaler_b" {

  ami           = var.zscaler_ami
  instance_type = "m5.large"
  subnet_id     = data.aws_subnet.private_b.id

  vpc_security_group_ids = [
    aws_security_group.zscaler_sg.id
  ]

  key_name = var.key_name

  user_data = file("${path.module}/userdata/bootstrap.sh")

  tags = {
    Name = "st-zscaler-az-b"
  }
}
