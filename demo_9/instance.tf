resource "aws_instance" "demo_9" {
    ami = var.AMIS[var.AWS_REGION]
    instance_type = "t2.micro"


    tags = {
        Name = "demo_9"
    }

    # ec2 launch in subnet id 

    subnet_id = aws_subnet.public-subnet-1.id


    # ec2 launch security-group

    vpc_security_group_ids = [aws_security_group.allow-ssh.id]

    # ec2 key pair 

    key_name = aws_key_pair.sonykey.key_name
}

resource "aws_ebs_volume" "ebs-volume-1" {
    availability_zone = "ap-southeast-1a"
    type = "gp2"
    size = 20

     tags = {
         Name = "extra-volume-date"
     }
}


resource "aws_volume_attachment" "ebs-volume-1-attachment" {
    device_name = "/dev/sdh"
    instance_id = aws_instance.demo_9.id
    volume_id = aws_ebs_volume.ebs-volume-1.id
}