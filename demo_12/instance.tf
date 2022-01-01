resource "aws_instance" "demo_12" {
    ami   = var.AMIS[var.AWS_REGION]
    instance_type = "t2.micro"

    tags = {
        Name = "demo_12"
    }

    # instance launch subnet

    subnet_id = aws_subnet.public-1.id

    # instance security group

    vpc_security_group_ids = [aws_security_group.allow-ssh.id]

    # ssh key

    key_name = aws_key_pair.sonykey.key_name
}