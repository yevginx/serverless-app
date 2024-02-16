############ CloudFront #################

variable "bucket_name" {
  type = string
}

variable "bucket_tag_name" {
  type = string
}

variable "object_ownership" {
  type = string
}

variable "bucket_acl" {
  type = string
}

variable "s3_origin_id_name" {
  type = string
}

variable "hosting" {
  type = string
}

variable "s3_origin_config" {
  type = bool
}

variable "logs_bucket_name" {
  type = string
}

variable "cookies" {
  type = bool
}

variable "prefix" {
  type = string
}

variable "forwarded_values" {
  type = bool
}

variable "default_cache_behavior_allowed_methods" {
  type = list(string)
}

variable "default_cached_methods" {
  type = list(string)
}

variable "cookies_forward" {
  type = string
}

variable "min_ttl" {
  type = number
}

variable "default_ttl" {
  type = number
}

variable "max_ttl" {
  type = number
}

variable "path_pattern" {
  type = string
}

variable "path_pattern_1" {
  type = string
}

variable "headers" {
  type = string
}

variable "compress" {
  type = bool
}

variable "viewer_protocol_policy" {
  type = string
}

variable "viewer_protocol_policy_1" {
  type = string
}

variable "geo_restriction" {
  type = string
}

variable "geo_restriction_tag" {
  type = string
}

variable "cloudfront_certificate" {
  type = bool
}

############ Api Gateway #################

variable "api_name" {
  type = string
}

variable "protocol_type" {
  type = string
}

variable "allow_origins" {
  type = string
}

variable "allow_methods" {
  type = list(string)
}

variable "allow_headers" {
  type = list(string)
}

variable "integration_type" {
  type = string
}

variable "integration_method" {
  type = string
}

variable "connection_type" {
  type = string
}

variable "payload_format_version" {
  type = string
}

variable "post_route_key" {
  type = string
}

variable "get_route_key" {
  type = string
}

variable "delete_route_key" {
  type = string
}

variable "authorization_type" {
  type = string
}

variable "statement_id_post" {
  type = string
}

variable "statement_id_get" {
  type = string
}

variable "statement_id_delete" {
  type = string
}

variable "lambda_action" {
  type = string
}

variable "lambda_principal" {
  type = string
}

variable "authorization_name" {
  type = string
}

variable "identity_sources" {
  type = string
}

############ Lambda Function #################

variable "file_type" {
  type = string
}

variable "source_dir" {
  type = string
}

variable "output_path" {
  type = string
}

variable "filename" {
  type = string
}

variable "function_name" {
  type = string
}

variable "handler" {
  type = string
}

variable "runtime" {
  type = string
}

variable "lambda_iam_role_name" {
  type = string
}

variable "dynamodb_access_policy_name" {
  type = string
}

variable "cognito_statement_id" {
  type = string
}

variable "cognito_principal" {
  type = string
}

variable "cognito_policy_arn" {
  type = string
}

variable "lambda_execution_arn" {
  type = string
}

variable "api_full_access_arn" {
  type = string
}

variable "dynamodb_full_access_arn" {
  type = string
}

############ DynamoDB table #################

variable "dynamodb_name" {
  type = string
}

variable "hash_key" {
  type = string
}

variable "range_key" {
  type = string
}

variable "billing_mode" {
  type = string
}

variable "attribute_type" {
  type = string
}

variable "dynamodb_table_tag" {
  type = string
}

############ Cognito #################

variable "user_pool_name" {
  type = string
}

variable "username_attributes" {
  type = string
}

variable "default_email_option" {
  type = string
}

variable "email_subject" {
  type = string
}

variable "email_message" {
  type = string
}

variable "attribute_data_type" {
  type = string
}

variable "false" {
  type = bool
}

variable "true" {
  type = bool
}

variable "min_length" {
  type = number
}

variable "max_length" {
  type = number
}

variable "password_minimum_length" {
  type = number
}

variable "mfa_configuration" {
  type = string
}

variable "recovery_mechanism_1" {
  type = string
}

variable "recovery_mechanism_2" {
  type = string
}

variable "user_pool_client_name" {
  type = string
}

variable "refresh_token_validity" {
  type = number
}

variable "allowed_oauth_flows" {
  type = string
}

variable "allowed_oauth_scopes" {
  type = list(string)
}

variable "origin_name" {
  type = string
}

variable "origin_type" {
  type = string
}

variable "signing_behavior" {
  type = string
}

variable "signing_protocol" {
  type = string
}
