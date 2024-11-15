data "aws_caller_identity" "current" {}

data "aws_cloudfront_distribution" "current" {
  id = aws_cloudfront_distribution.project_ada_terraform_distribution.id
}

locals {
  # Policy for CloudFront to access S3 bucket
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "AllowCloudFrontServicePrincipal",
        Effect = "Allow",
        Principal = {
          Service = "cloudfront.amazonaws.com"
        },
        Action   = "s3:GetObject",
        Resource = "arn:aws:s3:::${aws_s3_bucket.project_ada_terraform.bucket}/*",
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${data.aws_cloudfront_distribution.current.id}"
          }
        }
      },
    ]
  })

  # Identidades reutilizáveis
  s3_origin_id = aws_s3_bucket.project_ada_terraform.id
  lb_origin    = aws_lb.project_ada_terraform.id
}

resource "aws_s3_bucket_policy" "project_ada_terraform_policy" {
  bucket = aws_s3_bucket.project_ada_terraform.id
  policy = local.policy
}
