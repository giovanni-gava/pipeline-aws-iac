# 🚀 pipeline-aws-iac

This repository provides a robust and secure CI/CD pipeline to manage AWS infrastructure using Infrastructure as Code (IaC) with Terraform. The pipeline supports multi-account environments and enforces best practices for code validation, security, and deployment automation.

## ✅ Features

- **Secure Authentication**: Uses OIDC for secure GitHub-to-AWS authentication (no static credentials).
- **Code Validation**: Automatically runs `terraform fmt` and `terraform validate` on pull requests.
- **Cost Analysis**: Integrates with Infracost to estimate infrastructure costs.
- **Security Scanning**: Uses TFSec to detect misconfigurations and vulnerabilities.
- **Multi-Environment Support**: Supports isolated environments like `dev`, `staging`, and `production`.
- **Automated Testing**: TerraTest integration for infrastructure testing.
- **Linting and Formatting**: Enforced via `tflint` and custom linters.
- **Branch-Based Deployments**: Automatically plans and applies Terraform configurations based on branch.
- **Merge Control**: Prevents merging if validations or scans fail.

## 📁 Project Structure

```bash
pipeline-aws-iac/
├── .github/workflows/terraform.yml     # GitHub Actions pipeline
├── modules/                            # Reusable Terraform modules
│   ├── vpc/
│   ├── ec2/
│   └── ...
├── envs/                               # Environment-specific configurations
│   ├── development/
│   ├── staging/
│   └── production/
├── tests/                              # TerraTest tests
├── .tflint.hcl                         # Linting config
└── README.md                           # Project documentation
```

## 🚀 How to Use

### Prerequisites

- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- GitHub Actions OIDC role properly configured on AWS
- AWS account access with sufficient permissions

### Getting Started

1. **Clone the repository**
```bash
git clone https://github.com/giovanni-gava/pipeline-aws-iac.git
cd pipeline-aws-iac
```

2. **Set up environment variables**

Create a `.env` file or export variables manually:
```bash
export AWS_ACCOUNT_ID=your_account_id
export AWS_REGION=sa-east-1
```

3. **Run terraform init/plan/apply**

```bash
cd envs/development
terraform init
terraform plan
terraform apply
```

4. **Observe GitHub Actions pipeline**

- Validations and linting run on PRs
- `plan` runs on PRs
- `apply` runs on merges to main or env branches

## 📌 Available Modules

Each module is located under `modules/` and can be used in your environment config like this:

```hcl
module "vpc" {
  source = "../../modules/vpc"
  name   = "my-vpc"
  cidr   = "10.0.0.0/16"
}

module "ec2" {
  source = "../../modules/ec2"
  name   = "app-server"
  ami_id = "ami-xxxxxxx"
  instance_type = "t3.micro"
  vpc_id = module.vpc.id
}
```

## 📊 Diagrams

### Architecture Diagram
```
[ GitHub Actions ]
        |
        v
[ terraform.yml Workflow ]
        |
        v
+------------------+
|    terraform     |---> [ Plan / Apply ]
+------------------+
        |
        v
[ AWS Accounts ] (dev, staging, prod)
```

### Module Usage Example
```
+----------------+
|  envs/dev/     |
|  main.tf       |
+--------+-------+
         |
         v
+--------v-------+
|  modules/vpc    |
+----------------+
         |
         v
+--------v-------+
|  modules/ec2    |
+----------------+
```

## 🧪 Testing

Tests are located in the `tests/` folder and written using [TerraTest](https://terratest.gruntwork.io/). These tests validate:
- Resource creation
- Networking
- Outputs and variables

## 🔐 Security

- OIDC via GitHub Actions to assume IAM roles
- TFSec integration for security checks
- No plaintext credentials stored anywhere

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Feel free to fork and adapt this repository for your own AWS IaC pipeline.
