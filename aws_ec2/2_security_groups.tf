# Define the security group for the EC2 Instance
resource "aws_security_group" "my-ec2-sg" {
  name        = "my-ec2-sg"
  description = "Allow incoming connections"
  vpc_id      = data.aws_vpc.my-vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip] # Lockdown it down!
    description = "Allow incoming SSH connections"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "my-ec2-sg"
  }
}

# Get VPC to deploy SG on
data "aws_vpc" "my-vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_tag_value]
  }
}
