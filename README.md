<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.1 |
| aws | >= 3.47.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.47.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_appautoscaling_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) |
| [aws_appautoscaling_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) |
| [aws_autoscaling_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) |
| [aws_cloudwatch_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) |
| [aws_cloudwatch_log_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_stream) |
| [aws_ecs_capacity_provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_capacity_provider) |
| [aws_ecs_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) |
| [aws_ecs_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) |
| [aws_ecs_task_definition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecs_task_definition) |
| [aws_ecs_task_definition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) |
| [aws_iam_instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) |
| [aws_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) |
| [aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) |
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) |
| [aws_iam_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) |
| [aws_iam_service_linked_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_service_linked_role) |
| [aws_launch_template](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) |
| [aws_lb_target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/lb_target_group) |
| [aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) |
| [aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) |
| [aws_subnet_ids](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) |
| [aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami\_image\_id | EC2 AMI image to run in the ECS cluster | `any` | n/a | yes |
| app\_count | Number of docker containers to run | `any` | n/a | yes |
| app\_name | Name of the application | `any` | n/a | yes |
| bastion\_cidr | n/a | `any` | n/a | yes |
| container\_cpu | Container instance CPU units to provision (1 vCPU = 1024 CPU units) | `any` | n/a | yes |
| container\_instance\_type | n/a | `any` | n/a | yes |
| container\_memory | Container instance memory to provision (in MiB) | `any` | n/a | yes |
| ec2\_desired\_capacity | Number of EC2s in the cluster | `any` | n/a | yes |
| ec2\_ingress\_rules | n/a | <pre>map(object({<br>    description     = string<br>    from_port       = number<br>    to_port         = number<br>    protocol        = string<br>    security_groups = list(string)<br>    cidr_blocks     = list(string)<br>  }))</pre> | n/a | yes |
| ec2\_max\_size | Max Number of EC2s in the cluster | `any` | n/a | yes |
| ec2\_min\_size | Min Number of EC2s in the cluster | `any` | n/a | yes |
| environment | n/a | `any` | n/a | yes |
| instance\_type | EC2 instance type to run in the ECS cluster | `any` | n/a | yes |
| key\_name | Key to access EC2s in ECS cluster | `any` | n/a | yes |
| network\_mode | n/a | `any` | n/a | yes |
| public\_cidrs | n/a | `list(string)` | n/a | yes |
| server\_port | n/a | `any` | n/a | yes |
| subnet\_set\_name | n/a | `any` | n/a | yes |
| tags\_common | n/a | `map(string)` | n/a | yes |
| task\_definition | n/a | `any` | n/a | yes |
| task\_definition\_volume | n/a | `any` | n/a | yes |
| user\_data | n/a | `any` | n/a | yes |
| vpc\_all | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_ec2\_security\_group\_id | Security group id of EC2s used for ECS cluster |
| current\_task\_definition | n/a |

<!--- END_TF_DOCS --->
