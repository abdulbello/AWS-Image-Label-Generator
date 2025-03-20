variable "bucket_name" {
  description = "Name of the S3 bucket for storing images"
  type        = string
}

variable "lambda_arn" {
  description = "ARN of the Lambda function to trigger on image upload"
  type        = string
}
