# Create a DB subnet group for RDS
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]

  tags = {
    Name        = "rds-subnet-group"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

resource "aws_db_instance" "postgres" {
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "16.4"
  instance_class         = "db.t3.micro"
  db_name                = "postgresqldatabase"
  username               = "postgres"
  identifier             = "postgres-rds"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.sg_01.id]
  skip_final_snapshot    = true
  multi_az               = true
  publicly_accessible    = false

  tags = {
    Name        = "postgres-rds"
    Environment = var.Environment
    Owner       = var.Owner
  }
}
