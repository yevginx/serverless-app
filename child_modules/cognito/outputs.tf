output "user_pool_arn" {
  value = aws_cognito_user_pool.my_user_pool.arn
}

output "user_pool_client_id" {
  value = aws_cognito_user_pool_client.my_user_pool_client.id
}

output "user_pool_id" {
  value = aws_cognito_user_pool.my_user_pool.id
}

output "cognito_user_pool_endpoint" {
  value = aws_cognito_user_pool.my_user_pool.endpoint
}
