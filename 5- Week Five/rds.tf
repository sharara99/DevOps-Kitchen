
# Create a DB subnet group for RDS
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.subnet_01.id, aws_subnet.subnet_02.id]

  tags = {
    Name        = "rds-subnet-group"
    Environment = var.Environment
    Owner       = var.Owner
  }
}

# Create a PostgreSQL RDS instance
resource "aws_db_instance" "postgres" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "16.4"
  instance_class       = "db.t3.micro"
  db_name              = "postgresqldatabase"
  username             = "postgres"
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.sg_01.id]
  skip_final_snapshot  = true

  tags = {
    Name        = "postgres-rds"
    Environment = var.Environment
    Owner       = var.Owner
  }
}