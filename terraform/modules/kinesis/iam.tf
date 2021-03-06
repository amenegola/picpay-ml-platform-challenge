resource "aws_iam_policy" "read-only" {
  count = var.create_policy_read_only == true ? 1 : 0

  name        = format("kinesis-stream-%s-read-only", var.name)
  path        = "/"
  description = "Managed by Terraform"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = concat([
      {
        Effect = "Allow"
        Action = [
          "kinesis:DescribeLimits",
          "kinesis:DescribeStream",
          "kinesis:GetRecords",
          "kinesis:GetShardIterator",
          "kinesis:SubscribeToShard",
          "kinesis:ListShards"
        ]
        Resource = [
          aws_kinesis_stream.this.arn
        ]
      }
    ])
  })
}

resource "aws_iam_policy" "write-only" {
  count = var.create_policy_write_only == true ? 1 : 0

  name        = format("kinesis-stream-%s-write-only", var.name)
  path        = "/"
  description = "Managed by Terraform"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = concat([
      {
        Effect = "Allow"
        Action = [
          "kinesis:DescribeStream",
          "kinesis:PutRecord",
          "kinesis:PutRecords",
        ]
        Resource = [
          aws_kinesis_stream.this.arn
        ]
      }
    ])
  })
}

resource "aws_iam_policy" "admin" {
  count = var.create_policy_admin == true ? 1 : 0

  name        = format("kinesis-stream-%s-admin", var.name)
  path        = "/"
  description = "Managed by Terraform"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = concat([
      {
        Effect = "Allow"
        Action = [
          "kinesis:*",
        ]
        Resource = [
          aws_kinesis_stream.this.arn
        ]
      }
    ])
  })
}