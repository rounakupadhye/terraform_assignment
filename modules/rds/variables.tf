variable "rds_sg_id" {
}
variable "subnet_ids" {
  description = "RDS subnet group"
}
variable "db_instance_class" {
  description = "The instance type of the RDS instance."
}
variable "db_engine_version" {
  description = "The engine version to use."
}

