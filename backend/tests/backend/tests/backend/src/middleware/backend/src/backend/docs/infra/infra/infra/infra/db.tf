resource "aws_db_instance" "appdb" {
  identifier           = "bilingual-db"
  engine               = "postgres"
  engine_version       = "14.6"
  instance_class       = "db.t3.medium"
  allocated_storage    = 20
  storage_type         = "gp3"
  name                 = var.db_name
  username             = var.db_user
  password             = var.db_pass
  multi_az             = true
  backup_retention_period = 7
  skip_final_snapshot  = true
  tags = var.common_tags
}
