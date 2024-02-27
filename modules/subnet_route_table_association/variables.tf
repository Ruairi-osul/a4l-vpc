variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_route_table_id" {
  description = "The ID of the public route table"
  type        = string
}

variable "private_route_table_id" {
  description = "The ID of the private route table"
  type        = string
}

variable "private_subnet_ids" {
  description = "A list of private subnet IDs"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "A list of public subnet IDs"
  type        = list(string)
}
