# == REQUIRED VARS

variable "name" {
  description = "Name of your ECS cluster"
}

variable "container_port" {
  default = "8080"
}

variable "port" {
  default = "80"
}

variable "memory" {
  default = "512"
}

variable "cpu" {
  default = "0"
}

variable "cluster_name" {}

variable "service_role_arn" {}

variable "image" {}

variable "vpc_id" {}

variable "alb_listener_https_arn" {}
