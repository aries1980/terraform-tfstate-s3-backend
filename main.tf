# vim: et sr sw=2 ts=2 smartindent:

provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_s3_bucket" "tfstates" {
  bucket = "${var.project_prefix}-tfstates"
  acl    = "private"

  versioning {
    enabled = true
  }

  logging {
    target_bucket = "${aws_s3_bucket.infrastructure_logs.id}"
    target_prefix = "tfstate-logs/"
  }

  lifecycle_rule {
    id      = "${var.project_prefix}-tfstates"
    prefix  = ""
    enabled = true

    noncurrent_version_expiration {
      days = 30
    }
  }
}

resource "aws_s3_bucket" "infrastructure_logs" {
  bucket = "${var.project_prefix}-infrastructure-logs"
  acl    = "log-delivery-write"

  lifecycle_rule {
    id      = "tfstate-logs"
    prefix  = "tfstate-logs/"
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 180
      storage_class = "GLACIER"
    }

    expiration {
      days = 365
    }
  }
}

