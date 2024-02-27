# internet gateway
resource "aws_internet_gateway" "a4l_igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "a4l_igw"
  }
}
