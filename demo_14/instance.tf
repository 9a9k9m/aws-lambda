resource "aws_instance" "demo_14" {
    ami     = var.AMIS[var.AWS_REGION]
    instance_type   = "t2.micro"

    tags = {
        Name = "demo_14"
    }


    # instance subnet

    subnet_id = aws_subnet.public-1.id


    # instance security group

    vpc_security_group_ids = [aws_security_group.instance-sg.id]


    # the ssh public key

    key_name = aws_key_pair.mysonykey.key_name


    # role 

    iam_instance_profile = aws_iam_instance_profile.s3-mybucket-role-instanceprofile.name
}