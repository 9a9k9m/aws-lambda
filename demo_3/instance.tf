# output attributes
resource "aws_instance" "first_instance" {
    ami   = var.AMIS[var.AWS_REGION]
    instance_type = "t2.micro"

    provisioner "local.exce" {
        command = "echo ${aws_instance.first_instance.private_ip} >> private_ips.txt"
    }
}

output "ip" {
    value = aws_instance.first_instance.public_ip
}