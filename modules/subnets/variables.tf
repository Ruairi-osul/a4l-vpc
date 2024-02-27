variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "cidr_block_ipv4" {
  description = "The CIDR block of the VPC"
  type        = string
}

variable "cidr_block_ipv6" {
  description = "The IPv6 CIDR block of the VPC"
  type        = string
}

variable "public_subnets" {
  description = "A list of public subnets in each availability zone"
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of private subnets in each availability zone"
  type        = list(string)
}

variable "azs" {
  description = "A list of availability zones"
  type        = list(string)
}

variable "num_reserved_azs" {
  description = "The number of reserved availability zones"
  type        = number
}
