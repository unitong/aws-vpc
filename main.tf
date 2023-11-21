data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
 
  owners = ["099720109477"]   # Canonical
}


# Create a VPC
resource "aws_vpc" "test_resource" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.instance_name
  }
}


variable "instance_name" {
    type        = string
    description = "instance name"
    default = "test_resource"
}

variable "vpc_cidr_block" {
    type        = string
    description = "vpc cidr block"
    default = "172.16.0.0/16"
}

