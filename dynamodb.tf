resource "aws_dynamodb_table" "payment_ledger" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "TransactionID"

  attribute {
    name = "TransactionID"
    type = "S"
  }

  tags = merge(
    {
      Name = var.dynamodb_table_name
    },
    var.tags
  )
}
