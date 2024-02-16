
########### Lambda function ######################

data "archive_file" "lambda" {
  type        = var.file_type
  source_dir  = var.source_dir
  output_path = var.output_path
}

resource "aws_lambda_function" "lambda" {

  filename      = var.filename
  function_name = var.function_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = var.handler

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = var.runtime

  environment {
    variables = {
      TABLE_NAME = var.env_dynamodb
    }
  }
}

########### IAM role for Lambda function ###############

resource "aws_iam_role" "iam_for_lambda" {
  name = var.lambda_iam_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

############## Dynamo DB access policy ####################
# AWS IAM Policy
resource "aws_iam_policy" "lambda_dynamo_db_policy" {
  name = var.dynamodb_access_policy_name

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "dynamodb:GetItem",
                "dynamodb:PutItem",
                "dynamodb:UpdateItem",
                "dynamodb:Query",
                "dynamodb:DeleteItem"
            ],
            "Resource": "arn:aws:dynamodb:*:*:table/${var.dynamodb_access}"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        }
    ]
}
POLICY
}

# AWS IAM Role Policy Attachment
resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.iam_for_lambda.id
  policy_arn = aws_iam_policy.lambda_dynamo_db_policy.arn
}

######## cognito user pool policy ###############

resource "aws_iam_role_policy_attachment" "cognito_policy" {
  role       = aws_iam_role.iam_for_lambda.id
  policy_arn = var.cognito_policy_arn
}

############# cognito user pool trigger ###############

resource "aws_lambda_permission" "cognito_trigger_permission" {
  statement_id  = var.cognito_statement_id
  action        = var.lambda_action
  function_name = aws_lambda_function.lambda.function_name
  principal     = var.cognito_principal

  // Specify the region and user pool ID as the source ARN
  source_arn = var.user_pool_source_arn
}

############# LambdaBasicExecutionRole policy ######################

resource "aws_iam_role_policy_attachment" "lambda_execution" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = var.lambda_execution_arn
}

########### API Gateway Full Access ##########################

resource "aws_iam_role_policy_attachment" "api_full_access" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = var.api_full_access_arn
}

############# DynamoDB table Full Access policy ######################

resource "aws_iam_role_policy_attachment" "dynamodb_full_access" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = var.dynamodb_full_access_arn
}


