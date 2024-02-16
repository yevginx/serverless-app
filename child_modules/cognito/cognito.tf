resource "aws_cognito_user_pool" "my_user_pool" {
  name = var.user_pool_name

  username_attributes      = [var.username_attributes]
  auto_verified_attributes = [var.username_attributes]

  verification_message_template {
    default_email_option = var.default_email_option
    email_subject        = var.email_subject
    email_message        = var.email_message
  }
  schema {
    attribute_data_type      = var.attribute_data_type
    developer_only_attribute = var.false
    mutable                  = var.true
    name                     = var.username_attributes
    required                 = var.true

    string_attribute_constraints {
      min_length = var.min_length
      max_length = var.max_length
    }
  }

  password_policy {
    minimum_length  = var.password_minimum_length
    require_numbers = var.true
    require_symbols = var.true
  }

  username_configuration {
    case_sensitive = var.false
  }

  mfa_configuration = var.mfa_configuration


  account_recovery_setting {
    recovery_mechanism {
      name     = var.recovery_mechanism_1
      priority = 1
    }
    recovery_mechanism {
      name     = var.recovery_mechanism_2
      priority = 2
    }
  }

}


resource "aws_cognito_user_pool_client" "my_user_pool_client" {
  name                   = var.user_pool_client_name
  user_pool_id           = aws_cognito_user_pool.my_user_pool.id
  generate_secret        = var.false
  refresh_token_validity = var.refresh_token_validity

  allowed_oauth_flows  = [var.allowed_oauth_flows]
  allowed_oauth_scopes = var.allowed_oauth_scopes
  callback_urls        = ["https://${var.cloudfront_domain_name}/callback"]
}

