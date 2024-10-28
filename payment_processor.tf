resource "aws_lambda_function" "payment_processor" {
  function_name = var.lambda_function_name
  runtime       = "python3.9"
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "payment_processor.lambda_handler" # Update with actual handler
  filename      = "lambda/payment_processor.zip"     # Update with your actual path

  environment {
    variables = {
      DYNAMODB_TABLE_NAME = aws_dynamodb_table.payment_ledger.name
      KMS_KEY_ID          = var.kms_key_id
    }
  }

  tags = merge(
    {
      Name = var.lambda_function_name
    },
    var.tags
  )
}
