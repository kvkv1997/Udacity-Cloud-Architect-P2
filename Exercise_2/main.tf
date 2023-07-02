# Define the provider (AWS)
provider "aws" {
  access_key = "AKIAUDZ6C5IRRHZYFJNG"
  secret_key = "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"
  region = "us-east-1"
}

# Create an IAM role for the Lambda function
resource "aws_iam_role" "lambda_role" {
  name = var.lambda_role_name
  
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Attach necessary IAM policies to the Lambda role
resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambda_role.name
}

# Create the Lambda function
resource "aws_lambda_function" "lambda_function" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  filename      = var.lambda_zip_filename
  source_code_hash = filebase64sha256(var.lambda_zip_filename)

  # Configuration for the Lambda function
  environment {
    variables = var.lambda_environment_vars
  }
}
