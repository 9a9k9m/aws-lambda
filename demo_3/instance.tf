# output attributes

resouce "aws_key_pair" "mykey" {
    key_name = "mykey"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}


resource "aws_instance" "first_instance" {
    ami   = var.AMIS[var.AWS_REGION]
    instance_type = "t2.micro"
    key_name = "aws_key_pair.mykey.key_name"

    provisioner "local.exce" {
        command = "echo ${aws_instance.first_instance.private_ip} >> private_ips.txt"
    }
}

output "ip" {
    value = aws_instance.first_instance.public_ip
}