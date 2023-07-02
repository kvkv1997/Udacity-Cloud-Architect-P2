variable "aws_region" {
  description = "The AWS region where the Lambda function will be deployed"
  default     = "us-east-1"
}

variable "lambda_role_name" {
  description = "The name of the IAM role for the Lambda function"
  default     = "lambda-role"
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  default     = "my-lambda-function"
}

variable "lambda_handler" {
  description = "The name of the Lambda function handler"
  default     = "greet_lambda.lambda_handler"
}

variable "lambda_runtime" {
  description = "The runtime for the Lambda function"
  default     = "python3.8"
}

variable "lambda_zip_filename" {
  description = "The filename of the Lambda function code ZIP archive"
  default     = "lambda_function.zip"
}

variable "lambda_s3_bucket" {
  description = "The name of the S3 bucket containing the Lambda function code ZIP archive"
  default     = "arn:aws:s3:::my-lambda-bucket-udacity"
}

variable "lambda_environment_vars" {
  description = "Environment variables for the Lambda function"
  default     = {
    EXAMPLE_VAR = "example-value"
  }
}
