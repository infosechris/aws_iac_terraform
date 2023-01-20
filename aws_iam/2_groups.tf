# SecDevOps IAM group
resource "aws_iam_group" "secdevops" {
  name = "SecDevOps"
}

# Assign users to the SecDevOps group
resource "aws_iam_user_group_membership" "admin_mems" {
  count = length(var.secdevops_usernames)
  user   = aws_iam_user.secdevops[count.index].name
  groups = [aws_iam_group.secdevops.name]
}
