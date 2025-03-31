# Terraform Infrastructure Pipeline

A production-ready GitHub Actions pipeline for managing modular and multi-environment Terraform infrastructure with security, cost estimation, linting, and automated testing.

---

## ✅ Features

- 🔒 Secure AWS authentication via **OIDC (no access keys)**
- 🧹 Automatic `terraform fmt` + `validate` on Pull Requests
- 🧪 `TerraTest` integration for infrastructure testing
- 📊 Cost analysis with **Infracost**
- 🔐 Security scanning with **TFSec**
- 🚀 Multi-environment support (`development`, `staging`, `production`)
- ✅ Merge blocking until lint and validation pass
- 🔁 Automatic `plan` and `apply` per branch

---

## 📁 Project Structure

```bash
terraform-infra/
├── .github/workflows/terraform.yml     # GitHub Actions pipeline
├── modules/                            # Reusable Terraform modules
│   ├── vpc/
│   ├── ec2/
│   └── ...
├── envs/                               # Environment-specific configurations
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   └── backend.tf
│   ├── staging/
│   └── prod/
├── tests/                              # TerraTest files (Go)
│   ├── vpc_test.go
│   └── ...
└── README.md
```

---

## 🚀 Environments

Each Git branch maps to an isolated environment:

| Branch        | Directory       | AWS Role             |
|---------------|------------------|------------------------|
| `development` | `envs/dev`       | `AWS_ROLE_DEV`         |
| `staging`     | `envs/staging`   | `AWS_ROLE_STAGING`     |
| `production`  | `envs/prod`      | `AWS_ROLE_PROD`        |

---

## 🔐 Secure Authentication

This project uses GitHub Actions **OIDC integration with AWS IAM roles**. No static credentials required.

### 👣 Steps:

1. In AWS IAM, create a federated OIDC identity provider: `https://token.actions.githubusercontent.com`
2. Create IAM roles per environment with trust policies matching:
```json
"Condition": {
  "StringEquals": {
    "token.actions.githubusercontent.com:aud": "sts.amazonaws.com",
    "token.actions.githubusercontent.com:sub": "repo:<owner>/<repo>:ref:refs/heads/<branch>"
  }
}
```
3. Store each role's ARN as GitHub Secret:
   - `AWS_ROLE_DEV`
   - `AWS_ROLE_STAGING`
   - `AWS_ROLE_PROD`

---

## 🚧 CI/CD Workflow Overview

| Job         | Trigger        | Description                                  |
|-------------|----------------|----------------------------------------------|
| `fmt`       | PR             | Checks Terraform formatting                  |
| `validate`  | PR             | Validates Terraform syntax                   |
| `lint`      | PR             | Runs `tflint` for best practices             |
| `security`  | PR & Push      | Scans for security issues via TFSec         |
| `cost`      | PR & Push      | Displays cost estimate using Infracost      |
| `plan`      | Push only      | Runs Terraform plan for the environment     |
| `apply`     | Push only      | Applies infra changes with OIDC role        |
| `terratest` | PR & Push      | Executes infrastructure tests in Go         |

---

## ✅ Branch Protection Rules

To enable safe and clean code:

- Require PR review before merging
- Require status checks to pass:
  - `fmt`
  - `validate`

---

## 📦 Requirements

- GitHub repository
- AWS account with IAM roles and OIDC enabled
- GitHub Secrets:
  - `AWS_ROLE_DEV`, `AWS_ROLE_STAGING`, `AWS_ROLE_PROD`
  - `INFRACOST_API_KEY`

---

## 🤝 Contributing

Feel free to fork, clone, and extend this pipeline to your use case. PRs are welcome!

---

## 🧠 Credits

Maintained by [Giovanni](https://github.com/giovanni-gava) — DevOps & Cloud Engineer

---

## 📜 License

MIT License
