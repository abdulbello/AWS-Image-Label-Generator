output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = module.s3.bucket_name
}

output "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  value       = module.dynamodb.table_name
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = module.lambda.lambda_arn
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic"
  value       = module.sns.topic_arn
}

output "api_gateway_url" {
  description = "API Gateway invoke URL"
  value       = module.api_gateway.invoke_url
}
