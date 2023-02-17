data "aws_ecs_task_definition" "task_definition" {
  task_definition = "${var.app_name}-task-definition"
  depends_on      = [aws_ecs_task_definition.windows_ecs_task_definition, aws_ecs_task_definition.linux_ecs_task_definition]
}

data "aws_subnets" "shared-private" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
  tags = {
    Name = "${var.subnet_set_name}-private*"
  }
}

data "aws_lb_target_group" "target_group" {
  name = var.lb_tg_name
}
