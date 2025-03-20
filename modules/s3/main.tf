resource "aws_s3_bucket" "image_bucket" {
  bucket = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_notification" "lambda_trigger" {
  bucket = aws_s3_bucket.image_bucket.id

  lambda_function {
    lambda_function_arn = var.lambda_arn
    events              = ["s3:ObjectCreated:*"]
  }
}

# S3 Event Notification with IAM Role
resource "aws_s3_bucket_notification" "lambda_trigger" {
  bucket = aws_s3_bucket.image_bucket.id

  lambda_function {
    lambda_function_arn = var.lambda_arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_iam_role_policy_attachment.s3_lambda_attach]
}

