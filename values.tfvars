aws-region = "us-east-1"
ec2_attributes = {
  image_id      = "ami-0db1db956ce806195"
  instance_type = "t2.micro"
}


rds_attributes = {
  instance_class= "db.m4.large"
  db_engine_version= "10.22"
}