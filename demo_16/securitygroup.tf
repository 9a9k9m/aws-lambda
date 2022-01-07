resource "aws_security_group" "instance-sg" {
    vpc_id              = aws_vpc.main.id
    name                = "instance-sg"
    

    egress {
        from_port = 0 
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port     = 22
        to_port       = 22
        protocol      ="tcp"
        cidr_blocks   = ["0.0.0.0/0"]  
    }

    ingress {
        from_port     = 80
        to_port       = 80
        protocol      ="tcp"
        cidr_blocks   = ["0.0.0.0/0"] 
        security_groups = [aws_security_group] 
    }

    tags ={
        Name = "instance-sg"
    }
}

resource "aws_security_group" "elb-securitygroup" {
    vpc_id = aws_vpc.main.id
    name    = "elb"
    description = "security group of load balancer"


    egress {
        from_port   = 0 
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "elb"
    }
}