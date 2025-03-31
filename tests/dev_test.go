package test

import (
  "testing"
  "github.com/gruntwork-io/terratest/modules/terraform"
  "github.com/stretchr/testify/assert"
)

func TestInfra(t *testing.T) {
  tf := &terraform.Options{
    TerraformDir: "../envs/dev",
  }

  terraform.InitAndApply(t, tf)
  defer terraform.Destroy(t, tf)

  output := terraform.Output(t, tf, "example_output")
  assert.Equal(t, "expected_value", output)
}
