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
