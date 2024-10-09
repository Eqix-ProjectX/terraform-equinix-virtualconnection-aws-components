############# AWS Variables #################


variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
}


variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
}

variable "aws_vpc_id" {
  description = "AWS VPC ID"
  type        = string
}


variable "aws_subnet_id" {
  description = "AWS Subnet ID"
  type        = string
}

variable "aws_vpg_id" {
  description = "AWS VPG ID"
  type        = string
}