# DB Instance
resource "aws_instance" "db" {
  ami                         = var.ami_id
  instance_type               = var.instance_type_db
  subnet_id                   = var.subnet_id
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
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}-web"
    Role = "mern-web"
  }
}
