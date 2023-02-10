# Create S3 bucket for storing training artifacts
resource "aws_s3_bucket" "sm-pipelines-modelbuild" {
    bucket = "sm-pipelines-modelbuild-github-${var.env}"
    tags = local.common_tags
}