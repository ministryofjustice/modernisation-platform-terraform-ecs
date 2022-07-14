package main

import (
	"regexp"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestECSModule(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "./unit-test",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	roleName := terraform.Output(t, terraformOptions, "ecs_task_execution_role_id")
	taskDefinitionArn := terraform.Output(t, terraformOptions, "task_definition_arn")
	clusterArn := terraform.Output(t, terraformOptions, "ecs_cluster_arn")

	assert.Regexp(t, regexp.MustCompile(`^arn:aws:ecs:eu-west-2:\d{12}:task-definition*`), taskDefinitionArn)
	assert.Regexp(t, regexp.MustCompile(`^arn:aws:ecs:eu-west-2:\d{12}:cluster*`), clusterArn)
	assert.Regexp(t, regexp.MustCompile(`^*-ecs-task-execution-role`), roleName)
}
