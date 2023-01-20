# AWS Region
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

# Environment
variable "environment" {
  type    = string
  default = "test"
}

# VPC CIDR Range
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

# Public Subnet CIDR
variable "public_subnets_cidr" {
  type    = list(any)
  default = ["10.0.1.0/24"]
}

# Private Subnet CIDR
variable "private_subnets_cidr" {
  type    = list(any)
  default = ["10.0.2.0/24"]
}

# Availability Zones
variable "availability_zones" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b"]
}
