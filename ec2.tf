resource "aws_instance" "terra_private_ec2_1" {
  ami             = "ami-063d43db0594b521b"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.pat_terra_private_subnet_1.id
  security_groups = [aws_security_group.pat_allow_http.id]

  tags = {
    Name = "terra_private_ec2_1"
  }
}

resource "aws_instance" "terra_private_ec2_2" {
  ami             = "ami-063d43db0594b521b"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.pat_terra_private_subnet_2.id
  security_groups = [aws_security_group.pat_allow_http.id]

  tags = {
    Name = "terra_private_ec2_2"
  }
}

resource "aws_instance" "terra_private_ec2_3" {
  ami             = "ami-063d43db0594b521b"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.pat_terra_private_subnet_3.id
  security_groups = [aws_security_group.pat_allow_http.id]

  tags = {
    Name = "terra_private_ec2_3"
  }
}
