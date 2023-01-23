resource "aws_db_instance" "postgres-instance" {
  identifier             = "ps-test"
  db_name                   = "psdb"
  instance_class         = var.db_instance_class
  allocated_storage      = 10
  engine                 = "postgres"
  engine_version         = var.db_engine_version
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = [var.rds_sg_id]
  db_subnet_group_name  = aws_db_subnet_group.rds-subnet-group.name
  username               = "dev"
  password               = random_password.db_dev_pass.result

}

resource "aws_db_subnet_group" "rds-subnet-group" {
  name        = "psql-subnet-group"
  subnet_ids  = var.subnet_ids
}
# Generate random password string
resource "random_password" "db_dev_pass" {
  length            = 40
  special           = true
  min_special       = 5
  override_special  = "!#$%^&*()-_=+[]{}<>:?"
  keepers           = {
    pass_version  = 1
  }
}
#Create a secret manager to store db password
resource "aws_secretsmanager_secret" "db-password" {
  name = "dbpw-${terraform.workspace}"
}

resource "aws_secretsmanager_secret_version" "db-pass-val" {
  secret_id     = aws_secretsmanager_secret.db-password.id
  secret_string = random_password.db_dev_pass.result
}