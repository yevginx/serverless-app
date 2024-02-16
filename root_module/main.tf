
########## Modules ########################

module "cloudfront" {
  source                                 = "../child_modules/cloudfront_&_s3_bucket"
  bucket_name                            = var.bucket_name
  bucket_tag_name                        = var.bucket_tag_name
  object_ownership                       = var.object_ownership
  bucket_acl                             = var.bucket_acl
  s3_origin_id_name                      = var.s3_origin_id_name
  hosting                                = var.hosting
  s3_origin_config                       = var.s3_origin_config
  logs_bucket_name                       = var.logs_bucket_name
  cookies                                = var.cookies
  prefix                                 = var.prefix
  forwarded_values                       = var.forwarded_values
  default_cache_behavior_allowed_methods = var.default_cache_behavior_allowed_methods
  default_cached_methods                 = var.default_cached_methods
  cookies_forward                        = var.cookies_forward
  viewer_protocol_policy                 = var.viewer_protocol_policy
  min_ttl                                = var.min_ttl
  default_ttl                            = var.default_ttl
  max_ttl                                = var.max_ttl
  path_pattern                           = var.path_pattern
  path_pattern_1                         = var.path_pattern_1
  headers                                = var.headers
  compress                               = var.compress
  viewer_protocol_policy_1               = var.viewer_protocol_policy_1
  geo_restriction                        = var.geo_restriction
  geo_restriction_tag                    = var.geo_restriction_tag
  cloudfront_certificate                 = var.cloudfront_certificate
  origin_name                            = var.origin_name
  origin_type                            = var.origin_type
  signing_behavior                       = var.signing_behavior
  signing_protocol                       = var.signing_protocol
}


module "http_api" {
  source                 = "../child_modules/api_gateway"
  api_target             = module.lambda.lambda_arn
  function_name          = module.lambda.lambda_arn
  integration_uri        = module.lambda.lambda_invoke
  user_pool_client_id    = module.cognito.user_pool_client_id
  user_pool_endpoint     = module.cognito.cognito_user_pool_endpoint
  api_name               = var.api_name
  protocol_type          = var.protocol_type
  allow_origins          = var.allow_origins
  allow_methods          = var.allow_methods
  allow_headers          = var.allow_headers
  integration_type       = var.integration_type
  integration_method     = var.integration_method
  connection_type        = var.connection_type
  payload_format_version = var.payload_format_version
  post_route_key         = var.post_route_key
  get_route_key          = var.get_route_key
  delete_route_key       = var.delete_route_key
  authorization_type     = var.authorization_type
  statement_id_post      = var.statement_id_post
  statement_id_get       = var.statement_id_get
  statement_id_delete    = var.statement_id_delete
  lambda_action          = var.lambda_action
  lambda_principal       = var.lambda_principal
  authorizer_name        = var.authorization_name
  identity_sources       = var.identity_sources
}


module "lambda" {
  source                      = "../child_modules/lambda"
  dynamodb_access             = module.dynamodb.dynamodb_name
  env_dynamodb                = module.dynamodb.dynamodb_name
  user_pool_source_arn        = module.cognito.user_pool_arn
  file_type                   = var.file_type
  source_dir                  = var.source_dir
  output_path                 = var.output_path
  filename                    = var.filename
  function_name               = var.function_name
  handler                     = var.handler
  runtime                     = var.runtime
  lambda_iam_role_name        = var.lambda_iam_role_name
  dynamodb_access_policy_name = var.dynamodb_access_policy_name
  cognito_statement_id        = var.cognito_statement_id
  lambda_action               = var.lambda_action
  cognito_principal           = var.cognito_principal
  cognito_policy_arn          = var.cognito_policy_arn
  lambda_execution_arn        = var.lambda_execution_arn
  api_full_access_arn         = var.api_full_access_arn
  dynamodb_full_access_arn    = var.dynamodb_full_access_arn
}

module "dynamodb" {
  source             = "../child_modules/dynamodb"
  dynamodb_name      = var.dynamodb_name
  hash_key           = var.hash_key
  range_key          = var.range_key
  billing_mode       = var.billing_mode
  attribute_type     = var.attribute_type
  dynamodb_table_tag = var.dynamodb_table_tag
}

module "cognito" {
  source                  = "../child_modules/cognito"
  cloudfront_domain_name  = module.cloudfront.cloudfront_domain
  user_pool_name          = var.user_pool_name
  username_attributes     = var.username_attributes
  default_email_option    = var.default_email_option
  email_subject           = var.email_subject
  email_message           = var.email_message
  attribute_data_type     = var.attribute_data_type
  false                   = var.false
  true                    = var.true
  min_length              = var.min_length
  max_length              = var.max_length
  password_minimum_length = var.password_minimum_length
  mfa_configuration       = var.mfa_configuration
  recovery_mechanism_1    = var.recovery_mechanism_1
  recovery_mechanism_2    = var.recovery_mechanism_2
  user_pool_client_name   = var.user_pool_client_name
  refresh_token_validity  = var.refresh_token_validity
  allowed_oauth_flows     = var.allowed_oauth_flows
  allowed_oauth_scopes    = var.allowed_oauth_scopes
}
