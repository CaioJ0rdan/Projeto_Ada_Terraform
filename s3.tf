resource "aws_s3_bucket" "project_ada_terraform" {
  bucket = "project_ada_terraform-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name        = "project_ada_terraform"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "lb_logs" {
  bucket = "project_ada_terraform-lb-logs-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name        = "project_ada_terraform-lb-logs"
    Environment = "Dev"
  }
}
