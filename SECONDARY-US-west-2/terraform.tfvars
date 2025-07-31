## 🧾 Sample terraform.tfvars (DB Tier - SECONDARY-US-west-2)

# Region
region = "us-west-2"

# RDS Config
db_instance_class   = "db.t3.micro"
db_engine           = "mysql"
db_engine_version   = "8.0"
allocated_storage   = 20
db_name             = "mydb"
db_username         = "admin"
db_password         = "StrongPassword123!"
multi_az            = true

# Subnet Group
private_subnet_ids = ["subnet-xxx", "subnet-yyy"]  # from output of primary tier
vpc_id             = "vpc-xxxxxx"                 # from output of primary tier
