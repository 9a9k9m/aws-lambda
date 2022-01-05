resource "aws_security_group" "instance-sg" {
    vpc_id  = aws_vpc.main.id
    name    = "allow-ssh"
    description = "security group that allows ssh and all egress traffic"


    egress {
        from_port = 0
        tp_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        form_port   = 22 
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = ["0.0.0.0/0"]
    }


    tags  = {
        Name = "allow-ssh"
    }
}