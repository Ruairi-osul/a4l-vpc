resource "aws_route_table_association" "a4l_rt_subnet_public" {
  count          = length(var.public_subnet_ids)
  subnet_id      = var.public_subnet_ids[count.index]
  route_table_id = var.public_route_table_id
}

resource "aws_route_table_association" "a4l_rt_subnet_private" {
  count          = length(var.private_subnet_ids)
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = var.private_route_table_id
}
    
