# IAM Role for S3 to Assume
resource "aws_iam_role" "s3_lambda_role" {
  name = "S3LambdaInvokeRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "s3.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# IAM Policy for S3 to Invoke Lambda
resource "aws_iam_policy" "s3_lambda_policy" {
  name        = "S3LambdaInvokePolicy"
  description = "Allows S3 to invoke Lambda function"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = "lambda:InvokeFunction"
      Resource = var.lambda_arn
    }]
  })
}

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "s3_lambda_attach" {
  role       = aws_iam_role.s3_lambda_role.name
  policy_arn = aws_iam_policy.s3_lambda_policy.arn
}
