resource "aws_iam_role" "ecr_access" {
  for_each = toset(var.microservices)

  name = "ecr-access-role-${each.key}"

  # Define the assume role policy
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com" # ECS Task execution
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "ecr_policy" {
  for_each = toset(var.microservices)

  name        = "ecr-policy-${each.key}"
  description = "Policy to allow access to ECR for ${each.key} microservice"

  # Define the permissions for interacting with ECR
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:PutImage",
          "ecr:BatchGetImage",
          "ecr:DescribeRepositories",
          "ecr:CreateRepository"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecr_role_policy_attachment" {
  for_each = toset(var.microservices)

  policy_arn = aws_iam_policy.ecr_policy[each.key].arn
  role       = aws_iam_role.ecr_access[each.key].name
}
