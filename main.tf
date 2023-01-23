module "vpc" {
  source               = "./modules/vpc"
}

module "ec2-instance" {
  source                = "./modules/ec2"
  ami                   = var.ec2_attributes.image_id
  instance_type         = var.ec2_attributes.instance_type
  vpc_security_group_id = module.vpc.vpc_security_group_id
  subnet_id             = module.vpc.public_subnet_output[0]
}

module "rds" {
  source = "./modules/rds"
  rds_sg_id = module.vpc.rds_sg_id
  subnet_ids= module.vpc.private_subnet_output
  db_instance_class = var.rds_attributes.instance_class
  db_engine_version = var.rds_attributes.db_engine_version
}