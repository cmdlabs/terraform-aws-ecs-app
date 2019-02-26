resource "aws_lb_listener_rule" "green" {
  listener_arn = "${var.alb_listener_https_arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.green.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/${var.name}/*"]
  }
}

resource "aws_lb_listener_rule" "blue" {
  listener_arn = "${var.alb_listener_https_arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.blue.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/${var.name}-blue/*"]
  }
}

resource "aws_lb_target_group" "green" {
  name     = "ecs-${var.name}-green"
  port     = "${var.port}"
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
}

resource "aws_lb_target_group" "blue" {
  name     = "ecs-${var.name}-blue"
  port     = "${var.port}"
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
}
