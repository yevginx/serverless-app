####### Dynamo DB ###################

resource "aws_dynamodb_table" "dynamodb_table" {
  name         = var.dynamodb_name
  hash_key     = var.hash_key
  range_key    = var.range_key
  billing_mode = var.billing_mode

  attribute {
    name = var.hash_key
    type = var.attribute_type
  }
  attribute {
    name = var.range_key
    type = var.attribute_type
  }

  tags = {
    App = var.dynamodb_table_tag
  }
}
