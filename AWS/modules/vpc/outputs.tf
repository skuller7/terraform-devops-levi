output "vpc_id" {
  value = aws_vpc.main_network.id
}

output "frontend_subnet_id" {
  value = aws_subnet.frontend-main.id
}

output "backend_subnet_id" {
  value = aws_subnet.backend-main.id
}

output "security_group_id" {
  value = aws_security_group.uros_SG.id
}