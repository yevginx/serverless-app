output "gateway_id" {
  value     = module.http_api.api_id
  sensitive = true
}

output "user_pool_id" {
  value     = module.cognito.user_pool_id
  sensitive = true
}

output "user_pool_client_id" {
  value     = module.cognito.user_pool_client_id
  sensitive = true
}

output "s3_bucket_name" {
  value     = module.cloudfront.s3_bucket
  sensitive = true
}

output "cloud_front_distribution_id" {
  value     = module.cloudfront.cloud_front_distribution_id
  sensitive = true
}

output "http_endpoint" {
  value     = module.http_api.http_api_url
  sensitive = true
}
