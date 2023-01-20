# Security Group for the VPC
resource "aws_security_group" "default" {
  name        = "my-vpc-default-sg"
  description = "Default SG to allow I/O from the VPC"
  vpc_id      = aws_vpc.vpc.id

  # These rules will be superceded by resource security groups deployed in the VPC
  ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }
  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }

  depends_on = [aws_vpc.vpc]

  tags = {
    Environment = var.environment
  }
}
