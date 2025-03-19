# AWS IAM Automation with Terraform

This Terraform project automates the creation of AWS IAM users and roles with specified policies. It provides a reusable infrastructure as code solution for managing AWS IAM resources.

## Features

- Creates IAM users with specified names and tags
- Generates access keys for programmatic access
- Attaches multiple IAM policies to users
- Creates IAM roles with specified names and tags
- Configures trust relationships for IAM roles
- Attaches policies to IAM roles
- Outputs resource identifiers and credentials
- Supports multiple AWS authentication methods

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (version >= 1.2.0)
- AWS account with permissions to create IAM resources
- AWS credentials with appropriate permissions

## Project Structure

```
.
├── main.tf              # Main Terraform configuration
├── variables.tf         # Variable declarations
├── outputs.tf           # Output definitions
├── terraform.tfvars.example  # Example variables file
└── README.md           # This file
```

## AWS Authentication Setup

You have three options to configure AWS authentication:

### Option 1: Using terraform.tfvars (recommended for local development)

1. Copy the example variables file:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Edit terraform.tfvars with your AWS credentials:
   ```
   aws_access_key = "YOUR_ACCESS_KEY"
   aws_secret_key = "YOUR_SECRET_KEY"
   ```

### Option 2: Using environment variables

```bash
export AWS_ACCESS_KEY_ID="your_access_key"
export AWS_SECRET_ACCESS_KEY="your_secret_key"
export AWS_DEFAULT_REGION="us-east-1"
```

### Option 3: Using AWS CLI profiles

1. Configure your AWS CLI profile:
   ```bash
   aws configure --profile myprofile
   ```

2. Update the AWS provider in main.tf:
   ```
   provider "aws" {
     region  = var.aws_region
     profile = "myprofile"
   }
   ```

## Usage

1. Set up your AWS credentials using one of the methods above.
2. Modify the `terraform.tfvars` file to customize the IAM user and role names, policies, and other settings.
3. Initialize Terraform:

```bash
terraform init
```

4. Preview the changes:

```bash
terraform plan
```

5. Apply the configuration:

```bash
terraform apply
```

6. To view the created user credentials:

```bash
terraform output iam_user_name
terraform output iam_access_key_id
terraform output -raw iam_access_key_secret
```

## Security Considerations

1. **Credential Management**:
   - Never commit AWS credentials to version control
   - Use environment variables or AWS profiles in production
   - Consider using AWS Secrets Manager for credential management

2. **Least Privilege**:
   - Carefully select policies to attach to users and roles
   - Follow the principle of least privilege
   - Regularly review and rotate credentials

3. **State File Security**:
   - Use remote state storage with encryption
   - Consider using Terraform Cloud for managed state
   - Implement state file locking

## Clean Up

To destroy all created resources:

```bash
terraform destroy
```

## Customization

Edit the `terraform.tfvars` file to:
- Change the target AWS region
- Set custom IAM user and role names
- Specify different policy ARNs to attach
- Configure which AWS services can assume the role
- Add custom tags to resources

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- HashiCorp for creating Terraform
- AWS for their comprehensive IAM service 