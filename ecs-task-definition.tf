resource "aws_ecs_task_definition" "default" {
  family = "${var.name}"

  container_definitions = <<EOT
[
  {
    "name": "${var.name}",
    "image": "${var.image}",
    "cpu": ${var.cpu},
    "memory": ${var.memory},
    "essential": true,
    "portMappings": [
      {
        "containerPort": ${var.container_port}
      }
    ]
  }
]
EOT
}
