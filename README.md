# ECS Module for Windows and Linux 

Terraform module that creates an ECS cluster solely for EC2 launch type. This is aimed for services which cannot use Fargate.

* Creates ECS cluster and service
* Requires a loadbalancer resource created in the application Terraform directory.
* Stream logs to a CloudWatch log group encrypted with a KMS key.
* Associates target groups with Application Load Balancers (ALB).
* Supports running ECS tasks on EC2 instances only.
* Supports options for Windows or Linux container instances.

## Usage

```hcl
module "ecs" {

  source = "github.com/ministryofjustice/modernisation-platform-terraform-ecs/ecs"

  subnet_set_name          = local.subnet_set_name
  vpc_all                  = local.vpc_all
  app_name                 = local.application_name
  container_instance_type  = local.app_data.accounts[local.environment].container_instance_type
  environment              = local.environment
  ami_image_id             = local.app_data.accounts[local.environment].ami_image_id
  instance_type            = local.app_data.accounts[local.environment].instance_type
  user_data                = base64encode(data.template_file.launch-template.rendered)
  key_name                 = local.app_data.accounts[local.environment].key_name
  task_definition          = data.template_file.task_definition.rendered
  ec2_desired_capacity     = local.app_data.accounts[local.environment].ec2_desired_capacity
  ec2_max_size             = local.app_data.accounts[local.environment].ec2_max_size
  ec2_min_size             = local.app_data.accounts[local.environment].ec2_min_size
  container_cpu            = local.app_data.accounts[local.environment].container_cpu
  container_memory         = local.app_data.accounts[local.environment].container_memory
  task_definition_volume   = local.app_data.accounts[local.environment].task_definition_volume
  network_mode             = local.app_data.accounts[local.environment].network_mode
  server_port              = local.app_data.accounts[local.environment].server_port
  app_count                = local.app_data.accounts[local.environment].app_count
  public_cidrs             = [data.aws_subnet.public_az_a.cidr_block, data.aws_subnet.public_az_b.cidr_block, data.aws_subnet.public_az_c.cidr_block]
  bastion_cidr             = "${module.bastion_linux.bastion_private_ip}/32"
  tags_common              = local.tags

  depends_on               = [aws_ecr_repository.ecr_repo, aws_lb_listener.listener]
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.47.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

## Modules

No modules.

### Inputs

| Name                                       | Description                                                                  | Default                   | Required                                                                |
|--------------------------------------------|------------------------------------------------------------------------------|:-------------------------:|:-----------------------------------------------------------------------:|
| ami_image_id                 | EC2 AMI image to run in the ECS cluster                                    | - | yes |
| app_count                    | Number of docker containers to run                                         | - | yes |
| app_name                     | Name of the application/service                                            | - | yes |
| bastion_cidr                 | CIDR for the bastion                                                       | - | yes |
| container_cpu                | Container instance CPU units to provision (1 vCPU = 1024 CPU units)        | - | yes |
| container_instance_type.     | Which container OS is being used ("windows" or "linux")                    | - | yes |
| container_memory             | Container instance memory to provision (in MiB)                            | - | yes |
| ec2_desired_capacity         | Number of EC2s in the cluser                                               | - | yes |
| server_port                  | The port the containers will be listening on                               | - | yes |
| network_mode                 | The network mode used for the containers in the task                       | if ```container_instance_type = windows```  ```network_mode = none``` ; if ```container_instance_type = linux```, ```network_mode``` must equal ```none, bridge, awsvpc, and host```. If no network mode is specified, the default network mode is bridge.                                                                  | yes |
| ec2_max_size                 | Max number of EC2s in the cluster                                          | - | yes |
| ec2_min_size                 | Max number of EC2s in the cluster                                          | - | yes |
| environment                  | The environment where resources are to be created (development, test, production ) | - | yes |
| instance_type                | EC2 instance type to run in the ECS cluster                                | - | yes |
| key_name                     | Key too access EC2s in ECS cluster                                         | - | yes |
| public_cidrs                 | Public subnet CIDR blocks                                                  | - | yes |
| subnet_set_name              | The name of the subnet set associated with the account                     | - | yes |
| tags_common                  | Common tags to be used by all resources                                    | - | yes |
| task_definition              | Task definition to be used by the ECS service                              | - | yes |
| task_definition_volume       | Name of the volume referenced in the sourceVolume parameter of container definition in the mountPoints section | - | yes |
|user_data                     | The configuration used when creating EC2s used for the ECS cluster         | - | yes |
|vpc_all                       | The full name of the VPC (including environment) used to create resources  | - | yes |


### Outputs

| Name                | Description                                         |
|---------------------|-----------------------------------------------------|
| current_task_definition                 | The attributes of the created ECS task definition   |
| cluster_ec2_security_group_id           | Security group id of EC2s used for ECS cluster      |
