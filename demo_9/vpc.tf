resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "main"
    }
}


# public subnet

resource "aws_subnet" "public-subnet-1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-southeast-1a"

    tags = {
        Name = "public-subnet-1"
    }
}


resource "aws_subnet" "public-subnet-2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-southeast-1b"

    tags = {
        Name = "public-subnet-2"
    }
}


resource "aws_subnet" "public-subnet-3" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-southeast-1c"

    tags = {
        Name = "public-subnet-3"
    }
}


#private subnet

resource "aws_subnet" "private-subnet-1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "ap-southeast-1a"

    tags   = {
        Name = "private-subnet-1"
    }
}


resource "aws_subnet" "private-subnet-2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.5.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "ap-southeast-1b"

    tags = {

        Name = "private-subnet-2"
    }
}

 
resource "aws_subnet" "private-subnet-3" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.6.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "ap-southeast-1c"

    tags = {
        Name = "private-subnet-3"
    }
}


# internet Gateway

resource "aws_internet_gateway" "main_gw" {
    vpc_id = aws_vpc.main.id
    
    tags = {
        Name = "main-gw"
    }
}


# route table

resource "aws_route_table" "main-public" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_route_table.main-public.id
    }

    tags = {
        Name = "main-public"
    }
}

# route table association

resource "aws_route_table_association" "main-public-1-a{
    subnet_id = aws_subnet.main-public-1.id
    route_table_id = aws_route_table.main-public.id
} 

resource "aws_route_table_association" "main-public-1-b" {
    subnet_id = aws_subnet.main-public-2.id
    route_table_id = aws_route_table.main-public.id
}


resource "aws_route_table_association" "main-public-1-c" {
    subnet_id = aws_subnet.main-public-3.id
    route_table_id = aws_route_table.main-public.id
}