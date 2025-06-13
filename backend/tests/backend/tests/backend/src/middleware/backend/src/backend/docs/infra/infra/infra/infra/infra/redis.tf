resource "aws_elasticache_replication_group" "redis" {
  replication_group_id          = "bilingual-redis"
  replication_group_description = "Primary replication group"
  engine                        = "redis"
  engine_version                = "6.x"
  node_type                     = "cache.t3.micro"
  number_cache_clusters         = 2
  automatic_failover_enabled    = true
  tags = var.common_tags
}
