output "dynamodb_arn" {
  value = aws_dynamodb_table.dynamodb_table.arn
}

output "dynamodb_name" {
  value = aws_dynamodb_table.dynamodb_table.name
}
