resource "aws_ecs_service" "default" {
  name            = "${var.name}"
  cluster         = "${var.cluster_name}"
  task_definition = "${aws_ecs_task_definition.default.arn}"
  desired_count   = 1
  iam_role        = "${var.service_role_arn}"

  load_balancer {
    target_group_arn = "${aws_lb_target_group.green.arn}"
    container_name   = "${var.name}"
    container_port   = "${var.container_port}"
  }

  deployment_controller {
    type = "CODE_DEPLOY"
  }
}
