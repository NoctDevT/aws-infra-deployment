provider "aws" {
  region  = "eu-north-1"
  profile = "Staging-env"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-bucket-239292"
}

