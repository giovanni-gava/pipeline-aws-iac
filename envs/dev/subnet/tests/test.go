package test

import (
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestPrivateSubnet(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../",
		NoColor:      true,
		Upgrade:      true,
	}

	// Inicializa e aplica o Terraform (necessário para capturar outputs)
	terraform.InitAndApply(t, terraformOptions)

	defer terraform.Destroy(t, terraformOptions) // destrói recursos após o teste

	vpcID := terraform.Output(t, terraformOptions, "vpc_id")
	subnetID := terraform.Output(t, terraformOptions, "subnet_id")
	cidrBlock := terraform.Output(t, terraformOptions, "subnet_cidr_block")

	assert.True(t, strings.HasPrefix(vpcID, "vpc-"), "VPC ID deve começar com 'vpc-'")
	assert.True(t, strings.HasPrefix(subnetID, "subnet-"), "Subnet ID deve começar com 'subnet-'")
	assert.Contains(t, cidrBlock, "10.0.", "CIDR deve conter prefixo 10.0.x.x")

	t.Logf("✅ VPC ID detectado: %s", vpcID)
	t.Logf("✅ Subnet ID detectado: %s", subnetID)
	t.Logf("✅ CIDR detectado: %s", cidrBlock)
}
