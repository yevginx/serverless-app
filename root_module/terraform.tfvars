############ CloudFront #################

bucket_name                            = "main-memo-app-bucket-school312"
bucket_tag_name                        = "Serverless app bucket"
object_ownership                       = "BucketOwnerPreferred"
bucket_acl                             = "private"
s3_origin_id_name                      = "myS3Origin"
hosting                                = "index.html"
s3_origin_config                       = true
logs_bucket_name                       = "memo-app-logs-312.s3.amazonaws.com"
cookies                                = false
prefix                                 = "myprefix"
forwarded_values                       = false
default_cache_behavior_allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
default_cached_methods                 = ["GET", "HEAD"]
cookies_forward                        = "none"
viewer_protocol_policy                 = "allow-all"
min_ttl                                = 0
default_ttl                            = 3600
max_ttl                                = 86400
path_pattern                           = "/memo/*"
path_pattern_1                         = "/mem"
headers                                = "Origin"
compress                               = true
viewer_protocol_policy_1               = "redirect-to-https"
geo_restriction                        = "none"
geo_restriction_tag                    = "dev"
cloudfront_certificate                 = true
origin_name                            = "memo-app-origin"
origin_type                            = "s3"
signing_behavior                       = "always"
signing_protocol                       = "sigv4"
############ Api Gateway #################

api_name               = "Memo-app-api"
protocol_type          = "HTTP"
allow_origins          = "*"
allow_methods          = ["POST", "GET", "DELETE", "PUT"]
allow_headers          = ["Content-Type", "X-Amz-Date", "Authorization", "X-Api-Key", "X-Amz-Security-Token"]
integration_type       = "AWS_PROXY"
integration_method     = "POST"
connection_type        = "INTERNET"
payload_format_version = "2.0"
get_route_key          = "Get /memo"
post_route_key         = "POST /memo"
delete_route_key       = "POST /memo/delete"
authorization_type     = "JWT"
statement_id_post      = "AllowExecutionFromAPIGateway"
statement_id_get       = "AllowExecutionFromAPIGatewayGet"
statement_id_delete    = "AllowExecutionFromAPIGatewayDelete"
lambda_action          = "lambda:InvokeFunction"
lambda_principal       = "apigateway.amazonaws.com"
authorization_name     = "http-api-authorizer"
identity_sources       = "$request.header.Authorization"

############ Lambda Function #################

file_type                   = "zip"
source_dir                  = "../backend/dist/"
output_path                 = "../backend/lambda.zip"
filename                    = "../backend/lambda.zip"
function_name               = "Memo_lambda"
handler                     = "handler.handler"
runtime                     = "nodejs18.x"
lambda_iam_role_name        = "LambdaRole_Memo_app"
dynamodb_access_policy_name = "lambda_dynamodb"
cognito_statement_id        = "AllowExecutionFromCognito"
cognito_principal           = "cognito-idp.amazonaws.com"
cognito_policy_arn          = "arn:aws:iam::aws:policy/AmazonCognitoPowerUser"
lambda_execution_arn        = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
api_full_access_arn         = "arn:aws:iam::aws:policy/AmazonAPIGatewayInvokeFullAccess"
dynamodb_full_access_arn    = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"

############ DynamoDB table #################

dynamodb_name      = "Memo_app_database"
hash_key           = "PK"
range_key          = "SK"
billing_mode       = "PAY_PER_REQUEST"
attribute_type     = "S"
dynamodb_table_tag = "Serverless_Memo_DynamoDB_Table"

############ Cognito #################

user_pool_name          = "MyUserPool"
username_attributes     = "email"
default_email_option    = "CONFIRM_WITH_CODE"
email_subject           = "Account Confirmation"
email_message           = "Your confirmation code is {####}"
attribute_data_type     = "String"
false                   = false
true                    = true
min_length              = 1
max_length              = 256
password_minimum_length = 7
mfa_configuration       = "OFF"
recovery_mechanism_1    = "verified_email"
recovery_mechanism_2    = "verified_phone_number"
user_pool_client_name   = "MyUserPoolClient"
refresh_token_validity  = 30
allowed_oauth_flows     = "implicit"
allowed_oauth_scopes    = ["email", "openid", "profile"]
