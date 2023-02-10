# Variables
#------------
variable "region" {
  description = "AWS region identifier"
}

variable "env" {
  description = "Name of the environment the infrastructure is for"
}

variable "sagemaker_full_access_arn" {
    description = "ARN of the policy to attach (must allow access to SageMaker)"
}