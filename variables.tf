variable "region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "The AWS profile to use"
  type        = string
  default     = "default"
}

variable "azs" {
  description = "The availability zones to use"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "num_reserved_azs" {
  description = "The number of reserved availability zones"
  type        = number
  default     = 1
}

variable "public_subnets" {
  description = "The public subnets in each availability zone"
  type        = list(string)
  default     = ["web"]
}

variable "private_subnets" {
  description = "The private subnets in each availability zone"
  type        = list(string)
  default     = ["app", "db", "reserved"]
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.16.0.0/16"
}
