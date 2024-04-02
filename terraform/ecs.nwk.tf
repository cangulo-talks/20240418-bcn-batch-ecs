# VPC
# main.tf

module "vpc" {
  source = "./vpc"

  vpc_name                  = local.resources_prefix
  cidr_block                = "10.0.0.0/16"
  public_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones        = ["eu-west-1a", "eu-west-1b"]
}

# Security Group
resource "aws_security_group" "fargate_sg" {
  name        = "${local.resources_prefix}-sg"
  description = "Allow access to the public facing load balancer"
  vpc_id      = module.vpc.vpc_id
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${local.resources_prefix}-sg"
  }
}
