terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.26.0"
    }
  }
}

resource "aws_vpc" "vpcNetworkA" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpcNetworkA"
  }
}

resource "aws_vpc" "vpcNetworkB" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "vpcNetworkB"
  }
}


resource "aws_subnet" "frontendNetA" {
  vpc_id     = aws_vpc.vpcNetworkA.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "frontendNetA"
  }
}

resource "aws_subnet" "frontendNetB" {
  vpc_id     = aws_vpc.vpcNetworkB.id
  cidr_block = "10.1.1.0/24"

  tags = {
    Name = "frontendNetB"
  }
}

resource "aws_subnet" "backendNetA" {
  vpc_id     = aws_vpc.vpcNetworkA.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "backendNetA"
  }
}

resource "aws_subnet" "backendNetB" {
  vpc_id     = aws_vpc.vpcNetworkB.id
  cidr_block = "10.1.2.0/24"

  tags = {
    Name = "backendNetB"
  }
}