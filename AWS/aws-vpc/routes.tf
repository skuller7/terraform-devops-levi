resource "aws_route_table" "networkAroutestable" {
  vpc_id = aws_vpc.vpcNetworkA.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.netAIGW.id
  }

  tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.frontendNetA.id
  route_table_id = aws_route_table.networkAroutestable.id
}

resource "aws_route_table" "networkBroutestable" {
  vpc_id = aws_vpc.vpcNetworkB.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.netBIGW.id
  }

  tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.frontendNetB.id
  route_table_id = aws_route_table.networkBroutestable.id
}