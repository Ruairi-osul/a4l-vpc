output "vpc_id" {
  value = aws_vpc.a4l_vpc.id
}

output "cidr_block_ipv4" {
  value = aws_vpc.a4l_vpc.cidr_block
}

output "cidr_block_ipv6" {
  value = aws_vpc.a4l_vpc.ipv6_cidr_block
}
