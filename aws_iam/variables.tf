variable "aws_region" {
    type = string
    description = "AWS Region"
    default = "us-east-1"
}

variable "secdevops_usernames" {
  type = list(string)
  description = "List of SecDevOp's users"
  default = ["chris"]
}
