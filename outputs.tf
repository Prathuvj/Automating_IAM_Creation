output "iam_user_name" {
  description = "The name of the created IAM user"
  value       = aws_iam_user.user.name
}

output "iam_user_arn" {
  description = "The ARN of the created IAM user"
  value       = aws_iam_user.user.arn
}

output "iam_access_key_id" {
  description = "The access key ID for the IAM user"
  value       = aws_iam_access_key.user_access_key.id
}

output "iam_access_key_secret" {
  description = "The secret access key for the IAM user"
  value       = aws_iam_access_key.user_access_key.secret
  sensitive   = true
}

output "iam_role_name" {
  description = "The name of the created IAM role"
  value       = aws_iam_role.role.name
}

output "iam_role_arn" {
  description = "The ARN of the created IAM role"
  value       = aws_iam_role.role.arn
} 