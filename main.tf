provider "aws" {
  region = "ap-southeast-1"
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "server-vpc"
  cidr = var.vpc_cidr_block 

  public_subnets  =  [var.subnet_cidr_block]
  public_subnet_tags = {Name = "${var.env-prefix}-public-subnets"}
  azs  = [var.avail_zone]

  tags = {
    Name = "${var.env-prefix}-server-vpc"
  }
}


module "webserver" {
  source = "./modules/webserver"
  vpc_id = module.vpc.vpc_id
  my_ip = var.my_ip
  env-prefix = var.env-prefix
  image_name = var.image_name
  instance_type = var.instance_type
  avail_zone = var.avail_zone
  path_to_public_key = var.path_to_public_key
  subnet_id = module.vpc.public_subnets[0] 
}
