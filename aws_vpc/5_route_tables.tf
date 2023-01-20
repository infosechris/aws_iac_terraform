# Public route table
resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "public-route-table"
    Environment = var.environment
  }
}

# Private route table
resource "aws_route_table" "private_rtb" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "private-route-table"
    Environment = var.environment
  }
}

# Route for Internet Gateway
resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Route for Nat Gateway
resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.private_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.ngw.id
}

# Route table association to the Public subnets
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets_cidr)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public_rtb.id
}

# Route table association to the Private subnets
resource "aws_route_table_association" "private" {
  count          = length(var.private_subnets_cidr)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private_rtb.id
}
