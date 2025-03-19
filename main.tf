terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = var.aws_region
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key
  profile = var.aws_profile
}

# Create IAM User
resource "aws_iam_user" "user" {
  name = var.iam_user_name
  path = "/"
  tags = var.tags
}

# Create access key for the IAM user
resource "aws_iam_access_key" "user_access_key" {
  user = aws_iam_user.user.name
}

# Attach policies to the IAM user
resource "aws_iam_user_policy_attachment" "user_policy_attachment" {
  for_each   = toset(var.policy_arns)
  user       = aws_iam_user.user.name
  policy_arn = each.value
}

# Create IAM Role
resource "aws_iam_role" "role" {
  name               = var.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  tags               = var.tags
}

# Define trust relationship policy
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = var.trusted_services
    }
  }
}

# Attach policies to the IAM role
resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  for_each   = toset(var.policy_arns)
  role       = aws_iam_role.role.name
  policy_arn = each.value
} 