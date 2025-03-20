variable "function_name" {
  description = "Lambda function name"
  type        = string
}

variable "s3_bucket" {
  description = "S3 bucket where the Lambda package is stored"
  type        = string
}

variable "lambda_package" {
  description = "Path to Lambda deployment package in S3"
  type        = string
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  type        = string
}

variable "dynamodb_table_arn" {
  description = "ARN of the DynamoDB table"
  type        = string
}
