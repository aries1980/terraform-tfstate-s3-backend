variable "aws_region" {
  description = "AWS Region"
}

variable "project_prefix" {
  description = "Prefix for S3 buckets and logging."
}

variable "log_bucket" {
  description = "The S3 bucket that stores the infrastructure logs."
}
