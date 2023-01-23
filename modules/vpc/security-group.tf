resource "aws_security_group" "vpc_sg" {
  name        = "VPC-sg"
  description = "Default security group of VPC"

  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = aws_vpc.Main.id
  depends_on  = [aws_vpc.Main]
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    "Name" = "VPC-sg"
  }

}
# Security group for rds instance
resource "aws_security_group" "rds_sg" {
  name = "rds-sg"

  description = "Security group for RDS instance"
  vpc_id = aws_vpc.Main.id

  # allow traffic on db port 
  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    cidr_blocks = ["10.0.1.0/24"]
  }

  # allow all outbound traffic.
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

