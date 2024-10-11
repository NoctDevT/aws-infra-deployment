terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-239292"
    key    = "terraform.tfstate"
    region = "eu-north-1"
  }
}

resource "aws_s3_bucket" "static_website" {
  bucket = var.static_website_bucket_name
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.static_website.bucket
  key    = "index.html"
  source = "../frontend/index.html"
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket              = aws_s3_bucket.static_website.id
  block_public_policy = false
}

resource "aws_s3_bucket_policy" "website_policy" {
  bucket = aws_s3_bucket.static_website.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.static_website.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket" "terraform_bucket" {
  bucket = "terraform-state-bucket-239292"
}


resource "aws_route53_zone" "main" {
  name = var.domain_name 
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = aws_s3_bucket.static_website.website_endpoint
    zone_id                = aws_s3_bucket.static_website.hosted_zone_id
    evaluate_target_health = false
  }
}