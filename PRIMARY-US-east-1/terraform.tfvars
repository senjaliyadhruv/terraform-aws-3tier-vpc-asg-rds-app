## 🧾 Sample terraform.tfvars (App Tier - PRIMARY-US-east-1)

# Region
region = "us-east-1"

# VPC CIDR
vpc_cidr_block = "10.0.0.0/16"

# Public & Private Subnets
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

# EC2 Auto Scaling Config
instance_type     = "t2.micro"
desired_capacity  = 2
max_size          = 3
min_size          = 1
key_name          = "your-ssh-key-name"  # must exist in AWS region

# Bastion Host Config
bastion_instance_type = "t2.micro"

# ALB Config
alb_name        = "frontend-alb"
target_port     = 80
listener_port   = 80
