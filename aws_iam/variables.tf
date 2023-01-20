# AWS Region
variable "aws_region" {
    type = string
    default = "us-east-1"
}

# Users
variable "secdevops_usernames" {
  type = list(string)
  default = ["chris"]
}
