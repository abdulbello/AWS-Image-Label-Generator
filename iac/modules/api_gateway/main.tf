resource "aws_api_gateway_rest_api" "image_api" {
  name        = "ImageLabelAPI"
  description = "API to process images and get labels"
}

resource "aws_api_gateway_resource" "image_resource" {
  rest_api_id = aws_api_gateway_rest_api.image_api.id
  parent_id   = aws_api_gateway_rest_api.image_api.root_resource_id
  path_part   = "image"
}

resource "aws_api_gateway_method" "post_method" {
  rest_api_id   = aws_api_gateway_rest_api.image_api.id
  resource_id   = aws_api_gateway_resource.image_resource.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id = aws_api_gateway_rest_api.image_api.id
  resource_id = aws_api_gateway_resource.image_resource.id
  http_method = aws_api_gateway_method.post_method.http_method
  integration_http_method = "POST"
  type        = "AWS_PROXY"
  uri         = var.lambda_arn
}

resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = aws_api_gateway_rest_api.image_api.id
  depends_on  = [aws_api_gateway_integration.lambda_integration]
  stage_name  = "prod"
}
