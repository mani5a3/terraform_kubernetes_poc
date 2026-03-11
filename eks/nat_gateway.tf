# Allocate Elastic IP
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# NAT Gateway in public subnet
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "${var.cluster_name}-nat"
  }
}
