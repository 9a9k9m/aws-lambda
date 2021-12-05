# Demo remote state

resource "aws_instance" "ec2_4" {
    ami  = var.AMIS[var.AWS_REGION]
    instance_type = "t2.micro"
    provisioner "local-exec" {
        command = "echo ${aws_instance.ec2_4.private_ip} >> private_ips.txt"
    }
}

output "ip" {
    value = "aws_instace.ec2_4.public_ip"
}


