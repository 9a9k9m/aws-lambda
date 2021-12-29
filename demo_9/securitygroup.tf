resource "aws_security_group" "allow-ssh" {
    vpc_id = aws_vpc.main.id
    name = "allow-ssh"


    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_block = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port = 443 
        protocol = "https"
        cidr_block = ["0.0.0.0/0"]
    }


    ingress {
        from_port = 80
        to_port = 80
        protocol = "http"
        cidr_block = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_block = ["0.0.0.0/0"]

    }

    tags = {
        Name = "allow-ssh"
    }
}
