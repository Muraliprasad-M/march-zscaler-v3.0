resource "aws_lb" "zscaler_gwlb" {

  name               = "st-zscaler-gwlb"
  load_balancer_type = "gateway"

  subnets = [
    data.aws_subnet.private_a.id,
    data.aws_subnet.private_b.id
  ]

  tags = {
    Name = "st-zscaler-gwlb"
  }
}

resource "aws_lb_target_group" "zscaler_tg" {

  name     = "st-zscaler-tg"
  port     = 6081
  protocol = "GENEVE"
  vpc_id   = data.aws_vpc.st_vpc.id

  health_check {
    protocol = "TCP"
    port     = "443"
  }
}

resource "aws_lb_target_group_attachment" "zscaler_a" {

  target_group_arn = aws_lb_target_group.zscaler_tg.arn
  target_id        = aws_instance.zscaler_a.id
}

resource "aws_lb_target_group_attachment" "zscaler_b" {

  target_group_arn = aws_lb_target_group.zscaler_tg.arn
  target_id        = aws_instance.zscaler_b.id
}

resource "aws_lb_listener" "gwlb_listener" {

  load_balancer_arn = aws_lb.zscaler_gwlb.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.zscaler_tg.arn
  }
}
