resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "main"
    }
}


# public subnet

resource "aws_subnet" "public-1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    avilability_zone = "ap-southeast-1"
    map_public_ip_on_launch = "true"

    tags = {
        name = "public-1"
    }
}


resource "aws_subnet" "public-2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-southeast-1"
    map_public_ip_on__launch = "true"

    tags = {
        name = "public-2"
    }
}

resource "aws_subnet" "public-3" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-southeast-1"
    map_public_ip_on_launch = "true"

    tags = {
        name = "public-3"
    }
}

# private subnet

resource "aws_subnet" "private-1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "ap-southeast-1"
    map_private_ip_on_launch = "false"

    tags = {
        name = "private-1"
    }
}


resource "aws_subnet" "private-2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.5.0/24"
    availability_zone = "ap-southeast-1"
    map__private_ip_on_launch = "false"

    tags = {
        name = "private-2"
    }
}

resource "aws_subnet" "private-3" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.6.0/24"
    avilability_zone = "ap-southeast-1"
    map_private_ip_on_launch = "false"

    tags = {
        Name = "private-3"
    }
}

# internet gateway

resource "aws_ineternet_gateway" "main-gw" {
    vpc_id = aws_vpc.main.id

    tags = {
        name = "main-gw"
    }
}


# route table

resource "aws_route_table" "main-public" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main-gw.id

        tags = {
            Name = "main-public"
        }
    }
}


# Route table association

resource "route_table_association" "public-1-a" {
    subnet_id = aws_subnet.public-1.id
    route_table_id = aws_route_table.main-public.id
}

resource "route_table_association" "public-2-a" {
    subnet_id = aws_subnet.public-2.id
    route_table_id = aws_route_table.main-public.id
}

resource "route_table_association" "public-3-a" {
    subnet_id = aws_subnet.public-3.id
    route_table_id = aws_route_table.main-public.id
}