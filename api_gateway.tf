# Define the API Gateway
resource "aws_api_gateway_rest_api" "payment_api" {
  name        = var.api_gateway_name
  description = "API Gateway for payment decryption and storage"
}

# Define the /decrypt resource in API Gateway
resource "aws_api_gateway_resource" "decrypt_resource" {
  rest_api_id = aws_api_gateway_rest_api.payment_api.id
  parent_id   = aws_api_gateway_rest_api.payment_api.root_resource_id
  path_part   = "decrypt"
}

# Define the POST method for /decrypt
resource "aws_api_gateway_method" "decrypt_post" {
  rest_api_id   = aws_api_gateway_rest_api.payment_api.id
  resource_id   = aws_api_gateway_resource.decrypt_resource.id
  http_method   = "POST"
  authorization = "NONE" # Adjust authorization as needed
}

# Integrate API Gateway with Lambda function
resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.payment_api.id
  resource_id             = aws_api_gateway_resource.decrypt_resource.id
  http_method             = aws_api_gateway_method.decrypt_post.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.payment_processor.invoke_arn
}

# Deploy API Gateway
resource "aws_api_gateway_deployment" "api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.payment_api.id
  stage_name  = "dev"

  depends_on = [aws_api_gateway_integration.lambda_integration]
}

# Lambda permission to allow API Gateway invocation
resource "aws_lambda_permission" "api_gateway_invoke" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.payment_processor.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.payment_api.execution_arn}/*/*"
}
