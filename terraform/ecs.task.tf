# Create a new IAM role for the Fargate task
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "${local.resources_prefix}-fargate-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach the required policies to the IAM role
resource "aws_iam_role_policy_attachment" "ecsTaskExecutionPolicyAttachment" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  role       = aws_iam_role.ecs_task_execution_role.name
}

# Define ECS task definition: creating a Fargate task that runs an nginx web server container and outputs a success message when started.
resource "aws_ecs_task_definition" "fargate_task" {
  family                   = "${local.resources_prefix}-fargate-task"
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  requires_compatibilities = ["FARGATE"]
  container_definitions = jsonencode(
    [
      {
        "cpu" : 256,
        "image" : "nginx",
        "memory" : 512,
        "name" : "my_container",
        "command" : ["echo", "Task succeeded!"],
        "essential" : true,
        "portMappings" : [
          {
            "containerPort" : 80,
            "protocol" : "tcp"
          }
        ]
      }
  ])
}
