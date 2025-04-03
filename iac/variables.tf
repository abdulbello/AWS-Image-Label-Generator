variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "S3 bucket name for image storage"
  type        = string
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name for storing image labels"
  type        = string
}

variable "lambda_function_name" {
  description = "Lambda function name"
  type        = string
}

variable "sns_topic_name" {
  description = "SNS topic name for notifications"
  type        = string
}
