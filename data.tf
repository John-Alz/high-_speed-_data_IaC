data "aws_caller_identity" "current" {
  provider = aws.main
}

data "aws_kms_key" "kms_dynamo" {
  provider = aws.main
  key_id   = "alias/aws/dynamodb"
}

data "aws_vpc" "main" {
  provider = aws.main
  filter {
    name   = "tag:Name"
    values = ["aws-landing-zone-VPC"]
  }
}

data "aws_security_group" "vpc_sgs" {
  provider = aws.main
  id       = "sg-05b288f275df24d07"
}

