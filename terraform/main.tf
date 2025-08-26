# Get default VPC
data "aws_vpc" "default" {
  default = true
}

# Get subnets in the default VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "local_file" "ansible_inventory" {
  content = <<EOT
[web]
web1 ansible_host=${aws_instance.web.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=/home/radeonxfx/prince-pair-x-2.pem

[db]
db1 ansible_host=${aws_instance.db.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=/home/radeonxfx/prince-pair-x-2.pem
EOT

  filename = "${path.module}/../ansible/inventory/hosts.ini"
}

# DB Instance
resource "aws_instance" "db" {
  ami                         = var.ami_id
  instance_type               = var.instance_type_db
  subnet_id                   = tolist(data.aws_subnets.default.ids)[0]   # first subnet
  vpc_security_group_ids      = [var.sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}-db"
    Role = "mongodb"
  }
}

# Web Instance
resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type_web
  subnet_id                   = tolist(data.aws_subnets.default.ids)[0]   # first subnet
  vpc_security_group_ids      = [var.sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}-web"
    Role = "mern-web"
  }
}
