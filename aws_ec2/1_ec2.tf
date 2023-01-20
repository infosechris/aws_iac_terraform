# Create EC2 Instance
resource "aws_instance" "my-ec2-server" {
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = var.instance_type
  subnet_id                   = data.aws_subnet.private-subnet.id # Grab from module
  vpc_security_group_ids      = [aws_security_group.my-ec2-sg.id]
  key_name                    = aws_key_pair.key_pair.key_name
  associate_public_ip_address = var.associate_public_ip_address

  # optional bootstrap script
  //user_data = file("i-like-boostrap.sh")

  # root disk
  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    delete_on_termination = true
    encrypted             = true
  }

  # extra disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = var.data_volume_size
    volume_type           = var.data_volume_type
    encrypted             = true
    delete_on_termination = false
  }

  tags = {
    Name = "my-ec2-server-amazon-linux"
  }
}

# Create Elastic IP for the EC2 instance
resource "aws_eip" "ec2-eip" {
  vpc  = true
  tags = {
    Name = "my-ec2-eip"
  }
}

# Associate Elastic IP to the EC2 Instance
resource "aws_eip_association" "eip-association" {
  instance_id   = aws_instance.my-ec2-server.id
  allocation_id = aws_eip.ec2-eip.id
}

# Get latest Amazon Linux 2 AMI
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = [var.ami_tag_value]
  }
}

# Get subnet to deploy EC2 on
data "aws_subnet" "private-subnet" {
  vpc_id = data.aws_vpc.my-vpc.id
  filter {
    name   = "tag:Name"
    values = [var.subnet_tag_value]
  }
}
