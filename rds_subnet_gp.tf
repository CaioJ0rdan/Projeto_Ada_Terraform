resource "aws_db_subnet_group" "pat_terra_db_subnet_group" {
  name = "pat_terra_db_subnet_group"
  subnet_ids = [
    aws_subnet.pat_terra_private_database_subnet_1.id,
    aws_subnet.pat_terra_private_database_subnet_2.id,
  aws_subnet.pat_terra_private_database_subnet_3.id]

  tags = {
    Name = "pat_terra_db_subnet_group"
  }

}
