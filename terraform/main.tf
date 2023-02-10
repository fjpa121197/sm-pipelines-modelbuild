terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 1.2.0"
}

# Set the configuration for the aws provider, which is a plug in that Terraform uses to create and manage resources in aws.
# For example, one can set up credentials of AWS account in here, or set what profile to use if you have multiple stored credentials

provider "aws" {
}

# Important Outputs
# S3 Bucket Name
output "s3_bucket_id" {
  value = aws_s3_bucket.sm-pipelines-modelbuild.id
}

# SageMaker Execution Role
output "sagemaker_execution_role_id" {
  value = aws_iam_role.test_role_sagemaker.arn
}

