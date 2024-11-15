resource "aws_rds_cluster" "pat_db_terra_app" {
  cluster_identifier        = "pat-terra"
  availability_zones        = ["us-east-1a", "us-east-1b", "us-east-1c"]
  engine                    = "mysql"
  db_cluster_instance_class = "db.r6gd.xlarge"
  storage_type              = "io1"
  allocated_storage         = 100
  iops                      = 3000
  master_username           = "root"
  master_password           = random_password.password.result
  db_subnet_group_name      = aws_db_subnet_group.pat_terra_db_subnet_group.name
  vpc_security_group_ids    = [aws_security_group.pat_rds_sg.id]

  tags = {
    Name = "pat_terra_db_mysql"
  }
}
