locals {
  all_subnets = concat(aws_subnet.a4l_subnet_public, aws_subnet.a4l_subnet_private)

  subnet_tuples = [for subnet in local.all_subnets : {
    az = subnet.availability_zone
    id = subnet.id
  }]

  subnets_by_az   = { for tuple in local.subnet_tuples : tuple.az => tuple.id... }
  subnets_by_type = { for subnet in local.all_subnets : subnet.tags.SubnetType => subnet.id... }
}


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

output "subnets_by_az" {
  value = local.subnets_by_az
}

output "subnets_by_type" {
  value = local.subnets_by_type
}
