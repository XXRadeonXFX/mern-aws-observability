variable "aws_region" {
  default = "ap-south-1"
}

variable "key_name" {
  default = "prince-pair-x-2"
}

variable "ami_id" {
  default = "ami-02d26659fd82cf299"
}

variable "instance_type_web" {
  default = "t3.micro"
}

variable "instance_type_db" {
  default = "t3.micro"
}

variable "subnet_id" {
  description = "Use existing subnet ID"
  type        = string
}

variable "sg_id" {
  description = "Existing security group ID"
  type        = string
}

variable "project_name" {
  default = "travelmemory-observability"
}
