output "static_website_bucket_name" {
  value = aws_s3_bucket.static_website.bucket
}

output "terraform_state_bucket_name" {
  value = aws_s3_bucket.terraform_bucket.bucket
}

output "route53_zone_id" {
  description = "The ID of the Route 53 hosted zone."
  value       = aws_route53_zone.main.zone_id
}