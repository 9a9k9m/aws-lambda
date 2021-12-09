resource "aws_instance" "demo_8" {
    ami = var.AMIS[var.AWS_REGION]
    instance_type = "t2.micro"

    tags = {
        Name = "ec2-demo_8"
    }

    # ec2 launch in subnet id 
    
    subnet_id = aws_subnet.main-public-1.id

    # security group 

    vpc_security_group_ids = [aws_security_group.allow-ssh.id]
    
    # the public ssh key
    
    key_name = my_key_pair.mykeypair.key_name
}



