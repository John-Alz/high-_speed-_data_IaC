locals {

  kms_key = data.aws_kms_key.kms_dynamo.arn

  resource_policy = {
    policy_description = "Política para tabla de usuarios - acceso completo"
    statements = [
      {
        sid    = "AllowFullAccessToAccount"
        effect = "Allow"
        actions = [
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem",
          "dynamodb:BatchGetItem",
          "dynamodb:BatchWriteItem"
        ]
        resources = ["arn:aws:dynamodb:${var.region}:${data.aws_caller_identity.current.account_id}:table/${var.tables[0].name}"]
        principals = [
          {
            type        = "AWS"
            identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
          }
        ]
        condition = []
      }
    ]
  }

  tables_with_policy = [
    for table in var.tables : merge(table, {
      resource_policy = local.resource_policy
    })
  ]

}