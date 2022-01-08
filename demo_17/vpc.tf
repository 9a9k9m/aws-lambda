resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "main"
    }
}

# public subnets

resource "aws_subnet" "public-1" {
    vpc_id          = aws_vpc.main.id
    cidr_block      = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    avilability_zone        = "ap-southeast-1a"

    tags = {
        Name  = "public-1"
    }
}


resource "aws_subnet" "public-2" {
    vpc_id          = aws_vpc.main.id
    cidr_block      = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    avilability_zone        = "ap-southeast-1b"

    tags = {
        Name  = "public-2"
    }
}


resource "aws_subnet" "public-3" {
    vpc_id          = aws_vpc.main.id
    cidr_block      = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    avilability_zone        = "ap-southeast-1c"

    tags = {
        Name  = "public-3"
    }
}


# private subnets

resource "aws_subnet" "private-1" {
    vpc_id          = aws_vpc.main.id
    cidr_block      = "10.0.4.0/24"
    map_public_ip_on_launch = "true"
    avilability_zone        = "ap-southeast-1a"

    tags = {
        Name  = "private-1"
    }
}


resource "aws_subnet" "private-2" {
    vpc_id          = aws_vpc.main.id
    cidr_block      = "10.0.5.0/24"
    map_public_ip_on_launch = "true"
    avilability_zone        = "ap-southeast-1b"

    tags = {
        Name  = "private-2"
    }
}


resource "aws_subnet" "private-3" {
    vpc_id          = aws_vpc.main.id
    cidr_block      = "10.0.6.0/24"
    map_public_ip_on_launch = "true"
    avilability_zone        = "ap-southeast-1c"

    tags = {
        Name  = "private-3"
    }
}


# internet gateway

resource "aws_internet_gateway" "main-ig" {
    vpc_id  = aws_vpc.main.id

    tags   =  {
        Name  = "main-ig"
    }
}


# route table

resource "aws_route_table" "public-route" {
    vpc_id = aws_vpc.main.id
    route {
        gateway_id = aws_internet_gateway.main-ig.id
        cidr_block = "0.0.0.0/0"
    }

    tags = {
        name = "public-route"
    }
}


#public route table association

resource "aws_route_table_association" "public-route-1-a" {
    subnet_id  = aws_subnet.public-1.id
    route_table_id = aws_route_table.public-route.id
}


resource "aws_route_table_association" "public-route-2-a" {
    subnet_id  = aws_subnet.public-2.id
    route_table_id = aws_route_table.public-route.id
}


resource "aws_route_table_association" "public-route-3-a" {
    subnet_id  = aws_subnet.public-3.id
    route_table_id = aws_route_table.public-route.id
}


# nat gateway

resource "aws_eip" "nat" {
    vpc = true
}

resource "aws_nat_gateway" "main-ngw" {
    allocation_id = aws_eip.nat.id
    subnet_id     = aws_subnet.public-1.id
    depends_on    = [aws_internet_gateway.main-gw]
}

# private route table 

resource "aws_route_table" "private-route" {
    vpc_id   = aws_vpc.main.id
    route {
        nat_gateway_id = aws_nat_gateway.main-ngw.id
        cidr_block = "0.0.0.0/0"
    }

    tags = {
        Name = "private-route"
    }
}


# private route table associatoion

resource "aws_route_table-association" "private-route-4-a" {
    subnet_id   = aws_subnet.private-1.id
    route_table_id = aws_route_table.private-route.id
}

resource "aws_route_table-association" "private-route-5-a" {
    subnet_id   = aws_subnet.private-2.id
    route_table_id = aws_route_table.private-route.id
}

resource "aws_route_table-association" "private-route-6-a" {
    subnet_id   = aws_subnet.private-3.id
    route_table_id = aws_route_table.private-route.id
}
