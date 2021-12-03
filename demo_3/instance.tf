# output attributes
resource "aws_instance" "ec2_3" {
    ami   = var.AMIS[var.AWS_REGION]
    instance_type = "t2.micro"

    provisioner "local-exec" {
        command = "echo ${aws_instance.ec2_3.private_ip} >> private_ips.txt"
    }
}

output "ip" {
    value = aws_instance.ec2_3.public_ip
}