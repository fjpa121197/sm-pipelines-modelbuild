# Define inline policies
data "aws_iam_policy_document" "inline_policy_s3_access" {
  statement {
    actions   = [
                "s3:GetObject",
                "s3:PutObject",
                "s3:DeleteObject",
                "s3:ListBucket"
            ]
    resources = ["arn:aws:s3:::*"]
  }
}
# Get/define trust relationship policy
data "aws_iam_policy_document" "sagemaker_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
  }
}


# Create IAM role to be used by SageMaker
resource "aws_iam_role" "test_role_sagemaker" {
  name = "SageMakerExecutionRole-sm-pipelines-model-build-${var.env}"

  assume_role_policy = data.aws_iam_policy_document.sagemaker_assume_role_policy.json

  inline_policy {
    name = "access-to-s33"
    policy = data.aws_iam_policy_document.inline_policy_s3_access.json
  }

  tags = local.common_tags
}

# Attach the policy to the role (SageMaker Role)
resource "aws_iam_role_policy_attachment" "attach-sagemaker-policy" {
  role       = "${aws_iam_role.test_role_sagemaker.name}"
  policy_arn = var.sagemaker_full_access_arn
}
