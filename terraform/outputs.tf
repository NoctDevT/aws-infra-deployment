output "static_website_bucket_name" {
  value = aws_s3_bucket.static_website.bucket
}

output "terraform_state_bucket_name" {
  value = aws_s3_bucket.terraform_bucket.bucket
}
