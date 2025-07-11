variable "rds-password" {
  description = "rds password"
  type        = string
  default     = "Dhruv123"
}
variable "rds-username" {
  description = "rds username"
  type        = string
  default     = "admin"
}
variable "ami" {
  description = "ami"
  type        = string
  default     = "ami-05ffe3c48a9991133"
}
variable "instance-type" {
  description = "instance-type"
  type        = string
  default     = "t2.micro"
}
variable "key-name" {
  description = "keyname"
  type        = string
  default     = "ec2"
}
variable "backup-retention" {
  type    = number
  default = "7"
}
