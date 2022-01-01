output "instance" {
    value = aws_instance.demo_12.public_ip
}

output "rds" {
    value = aws_db_instance.mariadb.endpoint
}

