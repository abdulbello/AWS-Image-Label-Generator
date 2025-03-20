terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# S3 Bucket Module
module "s3" {
  source         = "./modules/s3"
  bucket_name    = var.s3_bucket_name
  lambda_arn     = module.lambda.lambda_arn
}

# DynamoDB Module
module "dynamodb" {
  source        = "./modules/dynamodb"
  table_name    = var.dynamodb_table_name
}

# Lambda Module
module "lambda" {
  source         = "./modules/lambda"
  function_name  = var.lambda_function_name
  role_arn       = module.lambda.role_arn
  s3_bucket      = module.s3.bucket_name
  dynamodb_table = module.dynamodb.table_name
}

# SNS Module
module "sns" {
  source         = "./modules/sns"
  topic_name     = var.sns_topic_name
  lambda_arn     = module.lambda.lambda_arn
}

# API Gateway Module
module "api_gateway" {
  source         = "./modules/api_gateway"
  lambda_arn     = module.lambda.lambda_arn
}
