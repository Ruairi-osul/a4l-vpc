provider "aws" {
  region  = var.region
  profile = var.aws_profile
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.cidr_block
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
  depends_on = [
    module.vpc,
  ]
}

module "route_tables" {
  source = "./modules/route_tables"
  vpc_id = module.vpc.vpc_id
  igw_id = module.internet_gateway.igw_id
  depends_on = [
    module.vpc,
    module.internet_gateway
  ]
}

module "subnets" {
  source           = "./modules/subnets"
  vpc_id           = module.vpc.vpc_id
  cidr_block_ipv4  = var.cidr_block
  cidr_block_ipv6  = module.vpc.cidr_block_ipv6
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  azs              = var.azs
  num_reserved_azs = var.num_reserved_azs
  depends_on = [
    module.vpc,
  ]
}

module "subnet_route_table_association" {
  source                 = "./modules/subnet_route_table_association"
  vpc_id                 = module.vpc.vpc_id
  public_route_table_id  = module.route_tables.rt_public_id
  private_route_table_id = module.route_tables.rt_private_id
  public_subnet_ids      = module.subnets.public_subnet_ids
  private_subnet_ids     = module.subnets.private_subnet_ids
  depends_on = [
    module.vpc,
    module.subnets,
    module.route_tables
  ]
}

