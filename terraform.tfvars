my_ip = "122.161.246.167/32"
env-prefix = "dev"
image_name = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
instance_type = "t2.micro"
avail_zone = "ap-southeast-1"
path_to_public_key = "/home/ec2-user/. ssh/id_rsa.pub"
subnet_cidr_block = "10.0.2.0/24"
vpc_cidr_block = "10.0.0.0/16"
vpc_id = "server-vpc"
subnet_id = "module.vpc.subnet_id"