variable "api_name" {
  type = string
}

variable "protocol_type" {
  type = string
}

variable "api_target" {
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

variable "integration_uri" {
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

variable "function_name" {
  type = string
}

variable "lambda_principal" {
  type = string
}

variable "authorizer_name" {
  type = string
}

variable "identity_sources" {
  type = string
}

variable "user_pool_client_id" {
  type = string
}

variable "user_pool_endpoint" {
  type = string
}

