provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_vpc" "prod-vpc" {
  cidr_block       = var.vpc_cidr_block

  tags = {
    Name = "${var.prfix}-vpc"
  }
}


resource "aws_subnet" "prod-public-subnet" {
  vpc_id     = var.vpc_id
  cidr_blocks = var.subnet_cidr_block[0]
  map_public_ip_on_launch = "true"
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.prfix}-public-subnet"
  }
}


resource "aws_subnet" "prod-private-subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr_block[1]
  map_public_ip_on_launch = "false"
  availability_zone         = var.availability_zone

  tags = {
    Name = "${prefix}-private-subnet"
  }
}


# internet gateway

esource "aws_internet_gateway" "gw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${prefix}-Igw"
  }
}


resource "aws_route_table" "prod-public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example.id
  }

  
  tags = {
    Name = "example"
  }
}


resource "aws_nat_gateway" "prod-NAT-gw" {
  subnet_id = var.subnet_id

  tags = {
    Name = "gw NAT"
  }
}


resource "aws_route_table_association" "prod-public-route-a" {
  subnet_id      = var.public_subnet_id
  route_table_id = var.route_table_id
}





