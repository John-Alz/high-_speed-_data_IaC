capacity           = "reto"
env                = "sbx"
country            = "co"
confidentiality    = "internal"
availability       = "moderate"
integrity          = "moderate"
pci                = false
information_domain = "information_domain"
personal_data      = false
standard_name      = false
tags               = {}

tables =[
  {
    name             = "users-table-reto"
    billing_mode     = "PAY_PER_REQUEST"
    hash_key         = "userId"
    range_key        = "date"
    stream_enabled   = true
    stream_view_type = "NEW_AND_OLD_IMAGES"
    attributes = [
      {
        name = "userId"
        type = "S"
      },
      {
        name = "date"
        type = "S"
      }
    ]
    global_secondary_indexs = []
    ttl = []
  }
]

elasticache_engine_type = "redis"
elasticache_engine_version = "7.0"
elasticache_node_type = "cache.t4g.micro"
elasticache_maintenance_window = "sun:05:00-sun:09:00"