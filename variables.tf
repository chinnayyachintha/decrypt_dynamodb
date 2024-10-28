variable "aws_region" {
  type        = string
  description = "AWS Region to deploy resources"
}

variable "dynamodb_table_name" {
  type        = string
  description = "Name of the DynamoDB table"
}

variable "lambda_function_name" {
  type        = string
  description = "Name of the Lambda function for payment processing"
}

variable "kms_key_id" {
  type        = string
  description = "AWS KMS Key ID for decrypting data"
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
}

variable "api_gateway_name" {
  type        = string
  description = "Name of the api gateway"
}
