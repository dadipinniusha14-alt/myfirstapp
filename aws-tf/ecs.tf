resource "aws_ecs_cluster" "ecs" {
    name = "${var.app_name}-cluster"
}