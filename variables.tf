variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "us-east-1"
}


variable "aws_profile" {
  description = "master profile"
  type     = string
  default = "mp-master"
}

variable "s3_bucket_name" {
  description = "Name for the bucket"
  type = string
  default = "mp-master-bucket"
}


variable "dynamodb_name" {
  description = "Name for the DynamoDB"
  type = string
  default = "mp-master-locks"
}

variable billing_mode_dynamodb {
description = "Billing Mode for DynamoDB"
type = string
default = "PAY_PER_REQUEST"
}

