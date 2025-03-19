variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}

variable "aws_profile" {
  description = "AWS CLI profile name"
  type        = string
  default     = "default"
}

variable "iam_user_name" {
  description = "Name of the IAM user to create"
  type        = string
  default     = "terraform-created-user"
}

variable "iam_role_name" {
  description = "Name of the IAM role to create"
  type        = string
  default     = "terraform-created-role"
}

variable "policy_arns" {
  description = "List of policy ARNs to attach to both the user and role"
  type        = list(string)
  default     = [
    "arn:aws:iam::aws:policy/ReadOnlyAccess",
    "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
  ]
}

variable "trusted_services" {
  description = "List of AWS services that can assume the role"
  type        = list(string)
  default     = ["ec2.amazonaws.com", "lambda.amazonaws.com"]
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
} 