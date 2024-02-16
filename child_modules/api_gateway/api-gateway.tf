
########### HTTP API Gateway #################

resource "aws_apigatewayv2_api" "api" {
  name          = var.api_name
  protocol_type = var.protocol_type
  target        = var.api_target
  cors_configuration {
    allow_origins = [var.allow_origins]
    allow_methods = var.allow_methods
    allow_headers = var.allow_headers
  }
}

############# Lambda integration ########################

resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id                 = aws_apigatewayv2_api.api.id
  integration_type       = var.integration_type
  integration_method     = var.integration_method
  integration_uri        = var.integration_uri
  connection_type        = var.connection_type
  payload_format_version = var.payload_format_version
}

############## api routes  #################

resource "aws_apigatewayv2_route" "post_route" {
  api_id             = aws_apigatewayv2_api.api.id
  route_key          = var.post_route_key
  target             = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
  authorizer_id      = aws_apigatewayv2_authorizer.cognito_user_pool_authorizer.id
  authorization_type = var.authorization_type
}

resource "aws_apigatewayv2_route" "get_route" {
  api_id             = aws_apigatewayv2_api.api.id
  route_key          = var.get_route_key
  target             = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
  authorizer_id      = aws_apigatewayv2_authorizer.cognito_user_pool_authorizer.id
  authorization_type = var.authorization_type
}



resource "aws_apigatewayv2_route" "delete_route" {
  api_id             = aws_apigatewayv2_api.api.id
  route_key          = var.delete_route_key
  target             = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
  authorizer_id      = aws_apigatewayv2_authorizer.cognito_user_pool_authorizer.id
  authorization_type = var.authorization_type
}

############# api stage #########################

# resource "aws_apigatewayv2_stage" "api_lambda_stage" {
#   api_id      = aws_apigatewayv2_api.api.id
#   name        = "$default"
#   auto_deploy = true
# }


############# Permissions #################

resource "aws_lambda_permission" "apigw_lambda_post" {

  statement_id  = var.statement_id_post
  action        = var.lambda_action
  function_name = var.function_name
  principal     = var.lambda_principal
  source_arn    = "${aws_apigatewayv2_api.api.execution_arn}/*/*"
}

resource "aws_lambda_permission" "apigw_lambda_get" {

  statement_id  = var.statement_id_get
  action        = var.lambda_action
  function_name = var.function_name
  principal     = var.lambda_principal
  source_arn    = "${aws_apigatewayv2_api.api.execution_arn}/*/*"
}

resource "aws_lambda_permission" "apigw_lambda_delete" {

  statement_id  = var.statement_id_delete
  action        = var.lambda_action
  function_name = var.function_name
  principal     = var.lambda_principal
  source_arn    = "${aws_apigatewayv2_api.api.execution_arn}/*/*"
}

######## user pool authorizer ###########

resource "aws_apigatewayv2_authorizer" "cognito_user_pool_authorizer" {
  api_id           = aws_apigatewayv2_api.api.id
  name             = var.authorizer_name
  authorizer_type  = var.authorization_type
  identity_sources = [var.identity_sources]

  jwt_configuration {
    audience = [var.user_pool_client_id]
    issuer   = "https://${var.user_pool_endpoint}"
  }
}


