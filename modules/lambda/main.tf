resource "aws_iam_role" "lambda_role" {
  name = "image-label-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy" "lambda_policy" {
  name        = "image-label-lambda-policy"
  description = "IAM policy for Lambda to access S3, Rekognition, and DynamoDB"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = ["s3:GetObject"]
        Effect = "Allow"
        Resource = "${var.s3_bucket_arn}/*"
      },
      {
        Action = ["rekognition:DetectLabels"]
        Effect = "Allow"
        Resource = "*"
      },
      {
        Action = ["dynamodb:PutItem"]
        Effect = "Allow"
        Resource = var.dynamodb_table_arn
      }
    ]
  })
}

resource "aws_lambda_function" "image_labeler" {
  function_name    = var.function_name
  role            = aws_iam_role.lambda_role.arn
  runtime        = "python3.9"
  handler        = "lambda_function.lambda_handler"
  s3_bucket      = var.s3_bucket
  s3_key         = var.lambda_package
}
