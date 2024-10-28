# Region where the AWS resources will be deployed
aws_region = "ca-central-1"

# Name of the DynamoDB table for storing decrypted payment data
dynamodb_table_name = "PaymentLedger"

# Name of the Lambda function responsible for decrypting payment data
lambda_function_name = "PaymentProcessorFunction"

# Name of the API Gateway that will invoke the Lambda function
api_gateway_name = "PaymentAPI"

# Tags to associate with AWS resources
tags = {
  Environment = "Development"
  Project     = "Payment Gateway"
  Owner       = "Anudeep"
}

# KMS Key ID for decrypting payment information
kms_key_id = ""
