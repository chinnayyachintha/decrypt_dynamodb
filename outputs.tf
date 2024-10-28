output "dynamodb_table_name" {
  value = aws_dynamodb_table.payment_ledger.name
}

output "lambda_function_arn" {
  value = aws_lambda_function.payment_processor.arn
}
