locals {
  project_name = "manage-container-task"

}

resource "random_string" "random" {
  length  = 16
  special = false
  upper   = false
}


# Define ECS cluster
resource "aws_ecs_cluster" "fargate_cluster" {
  name = "${local.project_name}-fargate-cluster"
}

resource "aws_ecs_service" "example" {
  name            = "${local.project_name}-fargate-service"
  cluster         = aws_ecs_cluster.fargate_cluster.id
  task_definition = aws_ecs_task_definition.fargate_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    security_groups = [aws_security_group.fargate_sg.id]
    subnets         = [module.vpc.public_subnet_1_id, module.vpc.public_subnet_2_id]
  }
}
