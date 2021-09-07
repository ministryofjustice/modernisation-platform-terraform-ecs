output "cluster_ec2_security_group_id" {
  description = "Security group id of EC2s used for ECS cluster"
  value       = aws_security_group.cluster_ec2.id
}

output "current_task_definition" {
  description = "Displays task definition information and version being used"
  value = data.aws_ecs_task_definition.task_definition
}
