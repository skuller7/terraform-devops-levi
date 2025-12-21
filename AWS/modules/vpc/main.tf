resource "aws_vpc" "main_network" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "main-network"
  }
}

resource "aws_subnet" "frontend-main" {
  vpc_id     = aws_vpc.main_network.id
  cidr_block = var.vpc_frontend_subnet

  tags = {
    Name = "frontend"
  }
}

resource "aws_subnet" "backend-main" {
  vpc_id     = aws_vpc.main_network.id
  cidr_block = var.vpc_backend_subnet

  tags = {
    Name = "backend"
  }
}

resource "aws_internet_gateway" "uros_igw" {
  vpc_id = aws_vpc.main_network.id

  tags = {
    Name = "uros_igw"
  }
}


resource "aws_route_table" "urosRouteTable" {
  vpc_id = aws_vpc.main_network.id

  route {
    cidr_block = var.route_cidr_block
    gateway_id = aws_internet_gateway.uros_igw.id
  }

  tags = {
    Name = "uros_newRoutetable"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.frontend-main.id
  route_table_id = aws_route_table.urosRouteTable.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.backend-main.id
  route_table_id = aws_route_table.urosRouteTable.id
}

resource "aws_security_group" "uros_SG" {
  name        = var.security_group_name
  description = "Main firewall rule set"
  vpc_id      = aws_vpc.main_network.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow incoming SSH traffic to enter"
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow incoming HTTP traffic to enter"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "uros_SG"
  }
}