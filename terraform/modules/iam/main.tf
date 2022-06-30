resource "aws_iam_policy" "s3_policy" {
    name        = "wook_s3_policy"
    path        = "/"
    description = "test s3 policy"
    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
           "Effect": "Allow"
           "Action": "s3:*"
           "Resource": "*"
        }
		]
})

  tags = {
    Name = "wook-test-policy"
  }
}
        
resource "aws_iam_role" "test_role" {
  name = "wook-test-role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Action" = "sts:AssumeRole"
        "Effect" = "Allow"
        "Principal" = {
          "Service" = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "wook-test-role"
  }
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.test_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "wook-test-profile"
  role = aws_iam_role.test_role.name
}
