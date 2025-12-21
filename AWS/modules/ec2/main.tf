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

  key_name = var.key_pair_name
  #user_data = var.user_data

  # Use templatefile function to read the script and pass variables
  user_data = templatefile("${path.module}/../../automate.sh", {
    server_name = var.server_name
   })

  user_data_replace_on_change = true

  tags = {
    Name = var.server_name
  }
}

# Napraviti tako da ovaj public kljuc smestam na AWS SMS i da ne bude hardcodovano, i napravim role gde kacim policy za servis EC2.
resource "aws_key_pair" "deployer" {
  key_name   = var.key_pair_name #"deployer-key"
  public_key = var.public_key 
}

resource "aws_network_interface" "uros_ENI" {
  subnet_id       = var.subnet_id #module.vpc.frontend_subnet_id
  security_groups = var.security_groups #[aws_security_group.uros_SG.id]

#   attachment {
#     instance     = module.ec2.uros_ec2.id
#     device_index = 1
#   }
}

resource "aws_eip" "uros_EIP" {
  network_interface = aws_network_interface.uros_ENI.id
  domain   = "vpc"
  depends_on = [ aws_instance.uros_ec2 ]
}

# resource "aws_network_interface_attachment" "this" {
#   instance_id = aws_instance.uros_ec2.id
#   network_interface_id = aws_network_interface.uros_ENI.id
#   device_index         = 1
# }
