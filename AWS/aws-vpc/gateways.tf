resource "aws_internet_gateway" "netAIGW" {
  vpc_id = aws_vpc.vpcNetworkA.id

  tags = {
    Name = "netAIGW"
  }
}

resource "aws_internet_gateway" "netBIGW" {
  vpc_id = aws_vpc.vpcNetworkB.id

  tags = {
    Name = "netBIGW"
  }
}