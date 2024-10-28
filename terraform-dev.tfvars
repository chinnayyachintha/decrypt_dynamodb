# AWS Region where resources will be deployed
aws_region = "ca-central-1"

# DynamoDB Table Name for storing payment data
dynamodb_table_name = "PaymentLedger"

# Lambda Function Name for decrypting and storing payment data
lambda_function_name = "PaymentProcessorFunction"

# KMS Key ID used for decryption in Lambda (replace with your actual KMS key ARN)
kms_key_id = ""

# Tags for AWS resources to indicate environment and ownership
tags = {
  Environment = "Development"
  Project     = "Payment Gateway"
  Owner       = "Anudeep"
}
