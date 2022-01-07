resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "main"
    }
}


#publci subnets

resource "aws_subnet" "public-1" {
    vpc_id = aws_vpc.main.id
    cidr_block      = "10.0.1.0/24"
    map_public_ip_on_launch  = "true"
    availability_zone       = "ap-southeast-1a"

    tags = {
        Name = "public-1"
    }
}


resource "aws_subnet" "public-2" {
    vpc_id = aws_vpc.main.id
    cidr_block      = "10.0.2.0/24"
    map_public_ip_on_launch  = "true"
    availability_zone       = "ap-southeast-1b"

    tags = {
        Name = "public-2"
    }
}


resource "aws_subnet" "public-3" {
    vpc_id = aws_vpc.main.id
    cidr_block      = "10.0.3.0/24"
    map_public_ip_on_launch  = "true"
    availability_zone       = "ap-southeast-1c"

    tags = {
        Name = "public-3"
    }
}

# private-subnet


resource "aws_subnet" "private-1" {
    vpc_id = aws_vpc.main.id
    cidr_block      = "10.0.4.0/24"
    map_public_ip_on_launch  = "false"
    availability_zone       = "ap-southeast-1a"

    tags = {
        Name = "private-1"
    }
}


resource "aws_subnet" "private-2" {
    vpc_id = aws_vpc.main.id
    cidr_block      = "10.0.5.0/24"
    map_public_ip_on_launch  = "false"
    availability_zone       = "ap-southeast-1b"

    tags = {
        Name = "private-2"
    }
}


resource "aws_subnet" "private-3" {
    vpc_id = aws_vpc.main.id
    cidr_block      = "10.0.6.0/24"
    map_public_ip_on_launch  = "false"
    availability_zone       = "ap-southeast-1c"

    tags = {
        Name = "private-3"
    }
}


# internet gateway

resource "aws_internet_gateway" "main-gw" {
    vpc_id = aws_vpc.mian.id

    tags  = {
        Name = "main-gw"
    }
}


# route table 
 
resource "aws_route_table" "public-route" {
    vpc_id = aws_vpc.main.id
    route {
        gateway_id = aws_internet_gateway.main-gw.id
        cidr_block = "0.0.0.0/0"
    }

    tags = {
        Name = "public-route"
    }
} 


#route table association

resource "aws_route_table_association" "public-route-1-a" {
    subnet_id = aws_subnet.public-1.id
    route_table_id = aws_route_table.public-route.id
}


resource "aws_route_table_association" "public-route-2-a" {
    subnet_id = aws_subnet.public-2.id
    route_table_id = aws_route_table.public-route.id
}


resource "aws_route_table_association" "public-route-3-a" {
    subnet_id = aws_subnet.public-3.id
    route_table_id = aws_route_table.public-route.id
}