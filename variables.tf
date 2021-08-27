variable "ami_image_id" {
  description = "EC2 AMI image to run in the ECS cluster"
}

variable "app_count" {
  description = "Number of docker containers to run"
}

variable "app_name" {
  description = "Name of the application"
}

variable "bastion_cidr" {

}

variable "container_cpu" {
  description = "Container instance CPU units to provision (1 vCPU = 1024 CPU units)"
}

variable "container_instance_type" {

}

variable "container_memory" {
  description = "Container instance memory to provision (in MiB)"
}

variable "ec2_desired_capacity" {
  description = "Number of EC2s in the cluster"
}

variable "ec2_max_size" {
  description = "Max Number of EC2s in the cluster"
}

variable "ec2_min_size" {
  description = "Min Number of EC2s in the cluster"
}

variable "environment" {

}

variable "instance_type" {
  description = "EC2 instance type to run in the ECS cluster"
}

variable "key_name" {
  description = "Key to access EC2s in ECS cluster"
}

variable "network_mode" {

}

variable "public_cidrs" {
  type = list(string)
}

variable "server_port" {

}

variable "subnet_set_name" {

}

variable "tags_common" {
  type = map(string)
}

variable "ec2_ingress_rules" {
  type = map(object({
    description     = string
    from_port       = number
    to_port         = number
    protocol        = string
    security_groups = list(string)
    cidr_blocks     = list(string)
  }))
}

variable "task_definition" {

}

variable "task_definition_volume" {

}

variable "user_data" {

}

variable "vpc_all" {

}
