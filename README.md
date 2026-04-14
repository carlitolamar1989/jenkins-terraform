# Deploy a Jenkins Server with Terraform

## Project Overview
This project deploys a Jenkins CI/CD server on AWS using Terraform. The infrastructure is fully automated and reproducible — one command creates the entire environment, and one command tears it down.

## Architecture
- **1 EC2 Instance** (t3.micro, Ubuntu 22.04 LTS) running Jenkins
- **Security Group** allowing SSH (port 22) and Jenkins UI (port 8080) from a specific IP
- **S3 Bucket** for Jenkins artifacts, locked down with public access block
- **Default VPC** — no custom networking required

## Prerequisites
- Terraform v1.x installed
- AWS CLI configured with valid credentials
- SSH key pair generated locally
- A GitHub account

## Files
| File | Purpose |
|---|---|
| `main.tf` | All Terraform resources (provider, VPC lookup, key pair, security group, EC2, S3) |
| `install_jenkins.sh` | Bootstrap script that installs Java 17 and Jenkins on first boot |
| `.gitignore` | Excludes .terraform/, state files, and private keys from version control |

## Usage

1. Clone this repo
2. Generate an SSH key pair:
3. Update the `cidr_blocks` in `main.tf` with your public IP
4. Run Terraform:
5. Wait 2-3 minutes for Jenkins to install, then open the output URL in your browser
6. SSH into the server to retrieve the initial admin password:

## Teardown

## Lessons Learned
- `t2.micro` is no longer free tier eligible on newer AWS accounts — use `t3.micro`
- Not all instance types are available in every Availability Zone
- Jenkins GPG signing keys rotate — always verify the key ID matches the repository
- Home IP addresses can change, requiring security group updates via `terraform apply`
- Infrastructure as Code makes troubleshooting faster: fix the code, reapply, done

## Built With
- Terraform
- AWS (EC2, S3, VPC)
- Jenkins
- Ubuntu 22.04 LTS
