# Get Admin Policy
data "aws_iam_policy" "admin_access" {
  name = "AdministratorAccess"
}

# Attach the Admin policy to the SecDevOps group
resource "aws_iam_group_policy_attachment" "admins" {
  group      = aws_iam_group.secdevops.name
  policy_arn = data.aws_iam_policy.admin_access.arn
}

# Create policy document for enforcing MFA
data "aws_iam_policy_document" "enforce_mfa" {
  statement {
    sid    = "DenyAllExceptListedIfNoMFA"
    effect = "Deny"
    not_actions = [
      "iam:CreateVirtualMFADevice",
      "iam:EnableMFADevice",
      "iam:GetUser",
      "iam:ListMFADevices",
      "iam:ListVirtualMFADevices",
      "iam:ResyncMFADevice",
      "sts:GetSessionToken"
    ]
    resources = ["*"]
    condition {
      test     = "BoolIfExists"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["false", ]
    }
  }
}

# Policy to enforce MFA to house the policy document
resource "aws_iam_policy" "enforce_mfa" {
  name        = "enforce-to-use-mfa"
  path        = "/"
  description = "Policy to allow MFA management"
  policy      = data.aws_iam_policy_document.enforce_mfa.json
}

# Attach the MFA policy to the SecDevOps group
resource "aws_iam_group_policy_attachment" "enforce_mfa" {
  group      = aws_iam_group.secdevops.name
  policy_arn = aws_iam_policy.enforce_mfa.arn
}
