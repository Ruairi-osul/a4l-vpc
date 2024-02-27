# Route table - public
resource "aws_route_table" "a4l_rt_public" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }
  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = var.igw_id
  }
  tags = {
    Name = "a4l_rt_public"
  }
}

# Route table - private
resource "aws_route_table" "a4l_rt_private" {
  vpc_id = var.vpc_id
  tags = {
    Name = "a4l_rt_private"
  }
}
