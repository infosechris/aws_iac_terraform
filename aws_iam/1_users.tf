# Users for secdevops team
resource "aws_iam_user" "secdevops" {
  count = length(var.secdevops_usernames)
  name = element(var.secdevops_usernames, count.index)
}
