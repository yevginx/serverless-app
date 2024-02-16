output "cloud_front_distribution_id" {
  value = aws_cloudfront_distribution.s3_distribution.id
}

output "s3_bucket" {
  value = aws_s3_bucket.memo_bucket.bucket
}

output "cloudfront_domain" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}
