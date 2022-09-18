data "aws_iam_policy_document" "assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [var.user_arn]
    }
  }  
}

resource "aws_iam_role" "dev_power_user" {
  name                = "DevPowerUser"
  assume_role_policy  = data.aws_iam_policy_document.assume-role-policy.json 
}

data "aws_iam_policy" "power_user_policy" {
  arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_iam_role_policy_attachment" "test_attatch" {
  role        = aws_iam_role.dev_power_user.name
  policy_arn  = data.aws_iam_policy.power_user_policy.arn
}
