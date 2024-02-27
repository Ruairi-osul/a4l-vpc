output "private_subnet_ids" {
  value = aws_subnet.a4l_subnet_private.*.id
}

output "public_subnet_ids" {
  value = aws_subnet.a4l_subnet_public.*.id
}

output "public_subnet_cidr_blocks" {
  value = aws_subnet.a4l_subnet_public.*.cidr_block
}

output "private_subnet_cidr_blocks" {
  value = aws_subnet.a4l_subnet_private.*.cidr_block
}
