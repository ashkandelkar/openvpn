resource "aws_eip" "ovpn" {
  instance = module.ec2_instance.id
  vpc      = true
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = var.name

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = true
  vpc_security_group_ids = [module.sg.id]
  subnet_id              = var.subnet_id

  tags = var.tags
  user_data = <<-EOF
  #!/bin/bash
  sudo apt update 
  cd /home/ubuntu
  wget https://git.io/vpn -O openvpn-install.sh
  sudo chmod 777 openvpn-install.sh
  EOF
}