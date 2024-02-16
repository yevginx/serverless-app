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

variable "cloudfront_domain_name" {
  type = string
}
