resource "aws_lb" "project_ada_terraform" {
  name               = "project-ada-terraform-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.pat_lb_sg.id]
  subnets            = ["terra_public_subnet_1", "terra_public_subnet_2", "terra_public_subnet_3"]

  enable_deletion_protection = false

  access_logs {
    bucket  = aws_s3_bucket.lb_logs.id
    prefix  = "project_ada_terraform-lb"
    enabled = true
  }


  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "project_ada_terraform" {
  name     = "project-ada-terraform-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.pat_terra_vpc.id
}

resource "aws_lb_target_group_attachment" "project_ada_terraform_instance_1" {
  target_group_arn = aws_lb_target_group.project_ada_terraform.arn      # Reference the declared target group
  target_id        = aws_instance.terra_private_ec2_1.id                # Attach the first instance
  port             = 80                                                 # Port where the application is listening
}

resource "aws_lb_target_group_attachment" "project_ada_terraform_instance_2" {
  target_group_arn = aws_lb_target_group.project_ada_terraform.arn      # Reference the declared target group
  target_id        = aws_instance.terra_private_ec2_2.id                # Attach the second instance
  port             = 80                                                 # Port where the application is listening
}

resource "aws_lb_target_group_attachment" "project_ada_terraform_instance_3" {
  target_group_arn = aws_lb_target_group.project_ada_terraform.arn      # Reference the declared target group
  target_id        = aws_instance.terra_private_ec2_3.id                # Attach the third instance
  port             = 80                                                 # Port where the application is listening
}

resource "aws_lb_listener" "project_ada_terraform" {
  load_balancer_arn = aws_lb.project_ada_terraform.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.project_ada_terraform.arn
  }
}
