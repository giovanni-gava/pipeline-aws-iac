package test

import (
  "testing"

  "github.com/gruntwork-io/terratest/modules/terraform"
  "github.com/stretchr/testify/assert"
)

func TestVpcModule(t *testing.T) {
  t.Parallel()

  terraformOptions := &terraform.Options{
    TerraformDir: "../../../envs/dev/vpc",

    Vars: map[string]interface{}{
      "name":                 "test-vpc",
      "cidr_block":           "10.0.0.0/16",
      "enable_dns_support":   true,
      "enable_dns_hostnames": true,
    },

    NoColor: true,
  }

  defer terraform.Destroy(t, terraformOptions)
  terraform.InitAndApply(t, terraformOptions)

  vpcID := terraform.Output(t, terraformOptions, "vpc_id")
  assert.NotEmpty(t, vpcID)
}
