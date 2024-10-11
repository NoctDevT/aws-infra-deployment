variable "aws_region" {
  description = "AWS region to deploy resources in"
  default     = "eu-north-1"
}

variable "aws_profile" {
  description = "AWS CLI profile to use"
  default     = "Staging-env"
}

variable "static_website_bucket_name" {
  description = "S3 bucket name for the static website"
  default     = "website-bucket-23948989"
}

variable "domain_name" {
  description = "The domain name for the static website."
  default     = "autumndev.net"
}