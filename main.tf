module "dynamodb" {
  providers = {
    aws.main = aws.main
  }
  source           = "git@github.com:NequiTI/terraform_dynamo_mod.git//modules/dynamodb?ref=v3.0.0"
  country            = var.country
  env                = var.env
  capacity           = var.capacity
  confidentiality    = var.confidentiality
  integrity          = var.integrity
  availability       = var.availability
  information_domain = var.information_domain
  personal_data      = var.personal_data
  pci                = var.pci
  dynamodb_kms_key   = local.kms_key
  tables             = local.tables_with_policy
  standard_name      = var.standard_name
  tags               = var.tags
}

module "elasticache" {
  providers = {
    aws.main = aws.main
  }
  source             = "git@github.com:NequiTI/terraform_elasticache_mod.git//modules/elasticache?ref=v4.1.0"
  availability       = var.availability
  pci                = var.pci
  capacity           = var.capacity
  confidentiality    = var.confidentiality
  country            = var.country
  env                = var.env
  information_domain = var.information_domain
  integrity          = var.integrity
  personal_data      = var.personal_data
  tags               = var.tags

  elasticache_engine_type               = var.elasticache_engine_type
  elasticache_engine_version            = var.elasticache_engine_version
  elasticache_maintenance_window        = var.elasticache_maintenance_window
  elasticache_node_type                 = var.elasticache_node_type
  elasticache_at_rest_encryption        = false
  security_group_ids                    = [data.aws_security_group.vpc_sgs.id]
}
