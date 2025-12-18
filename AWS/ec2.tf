module "ec2" {
  source = ".//modules/ec2"
  ami = "ami-068c0051b15cdb816"
  instance_type = "t2.micro"
  subnet_id = module.vpc.frontend_subnet_id
  security_groups = [module.vpc.security_group_id]

}