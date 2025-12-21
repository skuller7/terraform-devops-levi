module "ec2" {
  count = 2
  source = ".//modules/ec2"
  ami = "ami-068c0051b15cdb816"
  instance_type = "t2.micro"
  subnet_id = module.vpc.frontend_subnet_id
  security_groups = [module.vpc.security_group_id]
  key_pair_name = "deployer-key-${count.index}"
  public_key = var.public_key
  server_name = "Myec2server-${count.index}" 
}