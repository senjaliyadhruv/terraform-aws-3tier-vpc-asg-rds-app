# 🚀 Terraform AWS Multi-Region 3-Tier Infrastructure (EC2 + RDS)

This repository builds a **multi-region, production-grade 3-tier architecture** on AWS using Terraform.

It contains:
- A **VPC with Bastion, ALB, EC2 Auto Scaling Group (ASG)** in one region
- A **MySQL RDS instance with Multi-AZ failover** in a different AWS region
- Complete infrastructure automation using Terraform with modular code

This project is organized into two logical folders:

| Folder | Region | Components |
|--------|--------|------------|
| `PRIMARY-US-east-1/` | `us-east-1` | VPC, ALB, Bastion, EC2 ASG |
| `SECONDARY-US-west-2/` | `us-west-2` | RDS MySQL (Multi-AZ) |

---

## 🧰 Tech Stack

- **Terraform v1.6+**
- **Cloud Provider:** AWS
- **Regions Used:**
  - `us-east-1`: App tier (Bastion, ALB, EC2 ASG)
  - `us-west-2`: DB tier (RDS MySQL Multi-AZ)

### 🧱 AWS Services

- VPC, Subnets (Public/Private)
- Internet Gateway, NAT Gateway
- Application Load Balancer (ALB)
- EC2 Launch Templates, Auto Scaling Groups (ASG)
- RDS MySQL (Multi-AZ)
- IAM Roles, Security Groups
- Bastion Host
- Route Tables, Key Pair (optional)

## ✅ Features

- 🔁 Multi-region architecture for high availability and disaster recovery
- 🛡️ Layered security using public/private subnets and Security Groups
- ⚙️ Modular Terraform code (you can reuse the components)
- ☁️ Auto Scaling with Launch Template for EC2 instances
- 🧩 RDS deployment in a separate region to mimic DR scenarios
- 🔐 SSH bastion access to private subnets
- 📦 tfvars support for easy customization

---

## ⚙️ Deployment Instructions

### 🔑 Prerequisites

- Terraform v1.6+ installed
- AWS CLI configured with credentials (`aws configure`)
- Optional: your SSH key pair created and added to EC2 settings

---

### 🚀 Deploy Infrastructure

**Step 1: Deploy App Tier in `us-east-1` (PRIMARY)**

```bash
cd PRIMARY-US-east-1/
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"

cd ../SECONDARY-US-west-2/
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```
---

## 📐 Multi-Region High Availability Architecture (ASCII)

```
                        🌍 Internet Users
                              │
                              ▼
                      ┌───────────────────┐
                      │  Application Load │
                      │    Balancer (ALB) │
                      └────────▲──────────┘
                               │
                         Targets on Port 80
                               │
         ┌────────────────────┴────────────────────┐
         │                                         │
 ┌──────────────┐                         ┌──────────────┐
 │   EC2 App    │                         │   EC2 App    │
 │ Instance (AZ1)│                       │ Instance (AZ2)│
 └──────┬───────┘                         └──────┬───────┘
        │                                       │
        └────────────┬────────────┬────────────┘
                     │            │
               Private Subnets  Public Subnets
                     │            │
       ┌─────────────┴─────┐ ┌────┴────────────┐
       │   NAT Gateway     │ │  Bastion Host   │
       └────────┬──────────┘ └─────┬───────────┘
                │                  │
         ┌──────▼──────┐     ┌─────▼────────┐
         │  Internet   │     │  SSH Access  │
         │   Gateway   │     │   via Bastion│
         └─────────────┘     └──────────────┘

         ▼ VPC in us-east-1 (Primary Region)
                          │
                    ┌─────▼─────┐
                    │  RDS DB   │◄──┐
                    │  Primary  │   │
                    └───────────┘   │
                                    │ Replication
                                    ▼
                      ┌────────────────────────┐
                      │ RDS Read Replica       │
                      │ (Multi-AZ, us-west-2)  │
                      └────────────────────────┘

         ▼ EC2 App Backup (AMI from us-east-1)
         ┌────────────────────────┐
         │ Launch Template Copy   │
         │ (Region 2, AMI-based)  │
         └────────────────────────┘
```
---

## 🧠 Key Concepts Implemented

- 🔁 **High Availability using Multi-Region Deployment**
- 🧬 **AMI replication and re-use** via Launch Templates
- 📡 **RDS Primary + Read Replica** configured across regions
- ⚙️ ASG with Health Checks and Auto Healing
- 🔒 SSH Bastion used to access EC2s securely
- 🔁 Fully **Terraform-driven**, idempotent setup

  ---

## 🔗 Related Projects

- [🔧 Ansible 3-Tier Deployment](https://github.com/senjaliyadhruv/ansible-3-tier-deployment.git)  
  Automate app deployment with Ansible over this infrastructure.

- [🚀 Kubernetes App Deployment](https://github.com/senjaliyadhruv/Kubernetes-main.git)  
  Containerize and deploy multi-tier apps using Kubernetes & Helm.

---

## 🙋‍♂️ Author

**Dhruv Senjaliya**  
Cloud & DevOps Engineer  
📧 [Email](mailto:senjaliyadhruvr@gmail.com)  
🌐 [Portfolio](https://www.dhruvs.info)  
💼 [LinkedIn](https://linkedin.com/in/senjaliyadhruv)  
💻 [GitHub](https://github.com/senjaliyadhruv)

> If you found this helpful or impressive, please ⭐ star the repo and connect on LinkedIn.
