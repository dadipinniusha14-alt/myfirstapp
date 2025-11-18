resource "aws_ecs_service" "service" {
  name            = "${var.app_name}-service"
  cluster         = aws_ecs_cluster.ecs.id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = module.vpc.private_subnets
    security_groups = [aws_security_group.ecs_sg.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.app_tg.arn
    container_name   = var.app_name
    container_port   = 3000
  }

  depends_on = [aws_lb_listener.http_listener]
}
