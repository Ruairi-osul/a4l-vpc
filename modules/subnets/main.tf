locals {
  num_azs             = length(var.azs)
  num_reserved_az     = 1
  num_subnets_public  = length(var.public_subnets)
  num_subnets_private = length(var.private_subnets)
  num_subnets_per_az  = length(var.public_subnets) + length(var.private_subnets)
  num_subnets_total   = local.num_subnets_per_az * (local.num_azs + local.num_reserved_az)
  bit_length          = ceil(log(local.num_subnets_total, 2))
}

# Public subnets
resource "aws_subnet" "a4l_subnet_public" {
  count  = local.num_azs * local.num_subnets_public
  vpc_id = var.vpc_id
  cidr_block = cidrsubnet(
    var.cidr_block_ipv4, local.bit_length, count.index
  )
  ipv6_cidr_block = cidrsubnet(
    var.cidr_block_ipv6, local.bit_length, count.index
  )
  availability_zone               = var.azs[count.index % local.num_azs]
  map_public_ip_on_launch         = true
  assign_ipv6_address_on_creation = true
  tags = {
    Name       = "a4l_subnet_${var.azs[count.index % local.num_azs]}_${var.public_subnets[count.index % local.num_subnets_public]}"
    AZ         = var.azs[count.index % local.num_azs]
    SubnetType = var.public_subnets[count.index % local.num_subnets_public]
  }
}

# Private subnets
resource "aws_subnet" "a4l_subnet_private" {
  count  = local.num_subnets_private * local.num_azs
  vpc_id = var.vpc_id
  cidr_block = cidrsubnet(
    var.cidr_block_ipv4, local.bit_length, count.index + local.num_subnets_public * local.num_azs
  )
  ipv6_cidr_block = cidrsubnet(
    var.cidr_block_ipv6, local.bit_length, count.index + local.num_subnets_public * local.num_azs
  )
  availability_zone = var.azs[count.index % local.num_azs]
  tags = {
    Name       = "a4l_subnet_${element(var.azs, count.index % length(var.azs))}_${element(var.private_subnets, floor(count.index / length(var.azs)))}"
    AZ         = var.azs[count.index % local.num_azs]
    SubnetType = var.private_subnets[count.index % local.num_subnets_private]
  }
}
