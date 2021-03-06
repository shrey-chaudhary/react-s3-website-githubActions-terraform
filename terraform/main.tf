terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  backend "s3" {
    bucket         = "terraform-app-state-shrey"
    key            = "react-s3-app/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "terraform-state-locking-table"
  }
}

provider "aws" {
  region     = "us-east-2"
}

resource "aws_s3_bucket" "shrey-terraform-state" {
  bucket        = "terraform-app-state-shrey"
  force_destroy = true
  lifecycle {
    prevent_destroy = true
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locking-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "react-s3-bucket" {
  bucket = "react-s3-ga-bucket-sh"
  acl    = "public-read"
  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

