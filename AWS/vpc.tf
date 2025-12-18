module "vpc" {
  source              = ".//modules/vpc"
  vpc_cidr            = "10.100.0.0/16"
  vpc_frontend_subnet = "10.100.1.0/24"
  vpc_backend_subnet  = "10.100.2.0/24"
  route_cidr_block    = "0.0.0.0/0"
  security_group_name = "uros_SG_main"
}