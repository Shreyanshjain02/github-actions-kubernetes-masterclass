resource "aws_db_subnet_group" "rds" {
  name = "${var.environment}-rds-subnet-group"

  subnet_ids = var.private_subnets
}

resource "aws_security_group" "rds" {
  name   = "${var.environment}-rds-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "mysql" {
  identifier = "${var.environment}-skillpulse-mysql"

  engine         = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_encrypted = true

  db_name  = "skillpulse"
  username = "admin"
  password = "SkillPulse123!"

  skip_final_snapshot = true

  publicly_accessible = false

  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name   = aws_db_subnet_group.rds.name
}