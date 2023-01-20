variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_tag_value" {
  type        = string
  description = "Image tag name"
  default     = "amzn2-ami-hvm*"
}

variable "subnet_tag_value" {
  type        = string
  description = "Subnet tag value"
  default     = "my-private-subnet-1"
}

variable "vpc_tag_value" {
  type        = string
  description = "VPC tag value"
  default     = "my-vpc"
}

# Put your IP in tfvars or input on prompt
variable "my_ip" {
  type        = string
  description = "My public IpAddress ip/32"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address to the EC2 instance"
  default     = true
}

variable "root_volume_size" {
  type        = number
  description = "Root Volume size of the EC2 Instance"
  default     = "8"
}

variable "data_volume_size" {
  type        = number
  description = "Data volume size of the EC2 Instance"
  default     = "20"
}

variable "root_volume_type" {
  type        = string
  description = "Root volume type of the EC2 Instance"
  default     = "gp2"
}

variable "data_volume_type" {
  type        = string
  description = "Data volume type of the EC2 Instance"
  default     = "gp2"
}
