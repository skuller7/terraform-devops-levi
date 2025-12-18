resource "aws_instance" "uros_ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  

  primary_network_interface {
    network_interface_id = aws_network_interface.uros_ENI.id
  }

  # network_interface {
  #   network_interface_id = 
  #   instance     = aws_instance.uros_ec2.id
  #   device_index = 0
  # }

  tags = {
    Name = "urosEC2instance"
  }
}

resource "aws_network_interface" "uros_ENI" {
  subnet_id       = var.subnet_id #module.vpc.frontend_subnet_id
  security_groups = var.security_groups #[aws_security_group.uros_SG.id]

#   attachment {
#     instance     = module.ec2.uros_ec2.id
#     device_index = 1
#   }
}

# resource "aws_network_interface_attachment" "this" {
#   instance_id = aws_instance.uros_ec2.id
#   network_interface_id = aws_network_interface.uros_ENI.id
#   device_index         = 1
# }
