module "vpc" {
  source              = ".//modules/vpc"
  vpc_cidr            = "10.100.0.0/16"
  vpc_frontend_subnet = "10.100.1.0/24"
  vpc_backend_subnet  = "10.100.2.0/24"
  route_cidr_block    = "0.0.0.0/0"
  security_group_name = "uros_SG_main"
}

#dobra fora za debug
output "main_vpc_id" {
  description = "The VPC ID from the child module"
  value       = module.vpc.vpc_id
}

output "frontend_subnet" {
  description = "The VPC ID from the child module"
  value       = module.vpc.frontend_subnet_id
}

output "security_group" {
  description = "The VPC ID from the child module"
  value       = module.vpc.security_group_id
}