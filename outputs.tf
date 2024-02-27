output "vpc_id" {
  value = module.vpc.vpc_id
}

output "igw_id" {
  value = module.internet_gateway.igw_id
}

output "rt_public_id" {
  value = module.route_tables.rt_public_id
}

output "rt_private_id" {
  value = module.route_tables.rt_private_id
}

output "public_subnet_ids" {
  value = module.subnets.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.subnets.private_subnet_ids
}

output "subnets_by_az" {
  value = module.subnets.subnets_by_az
}

output "subnets_by_type" {
  value = module.subnets.subnets_by_type
}
