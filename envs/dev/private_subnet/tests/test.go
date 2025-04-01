package test

import (
	"testing"
	"strings"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestPrivateSubnet(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "../",

		// Evita que o teste aplique mudanças reais
		NoColor: true,
		Upgrade: true,
	}

	// Inicializa e aplica o Terraform (modo dry-run para pegar outputs)
	terraform.InitAndPlan(t, terraformOptions)
	outputs := terraform.OutputAll(t, terraformOptions)

	// Validando outputs esperados
	vpcID := outputs["vpc_id"].(string)
	subnetID := outputs["subnet_id"].(string)
	cidrBlock := outputs["subnet_cidr_block"].(string)

	assert.True(t, strings.HasPrefix(vpcID, "vpc-"), "VPC ID deve começar com 'vpc-'")
	assert.True(t, strings.HasPrefix(subnetID, "subnet-"), "Subnet ID deve começar com 'subnet-'")
	assert.Contains(t, cidrBlock, "10.0.", "CIDR deve conter prefixo 10.0.x.x")

	t.Logf("✅ VPC ID detectado: %s", vpcID)
	t.Logf("✅ Subnet ID detectado: %s", subnetID)
	t.Logf("✅ CIDR detectado: %s", cidrBlock)
}
