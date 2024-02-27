resource "aws_vpc" "a4l_vpc" {
  cidr_block                       = var.cidr_block
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = true
  tags = {
    Name = "a4l_vpc"
  }
}

