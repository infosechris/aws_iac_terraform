# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "my-internet-gateway"
    Environment = var.environment
  }
}
# Nat Gateway
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw_eip.id
  subnet_id     = element(aws_subnet.public_subnet.*.id, 0)

  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name        = "my-nat-gateway"
    Environment = var.environment
  }
}

# Elastic IpAddress
resource "aws_eip" "ngw_eip" {
  vpc = true

  depends_on = [aws_internet_gateway.igw]
}
