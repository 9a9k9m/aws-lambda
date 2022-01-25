resource "aws_security_group" "allow-ssh" {
  name        = "allow-ssh"
  description = "Allow ssh all inbound and outbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "ssh from anywhere"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "ssh from anywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.my_ip]
  }

  ingress {
    description      = "ssh from anywhere"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags  = {
      Name = "${var.env-prefix}-allow-ssh"
  }
}


data "aws_ami" "ubuntu" {
  most_recent = true
   owners = ["ubuntu"]

  filter {
    name   = "name"
    values = [var.image_name]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "mykeypair" {
    name = "mykeypair"
    public_key = file(var.path_to_public_key)
}



resource "aws_instance" "webserver" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type 
    
    subnet_id = var.subnet_id
    vpc_security_group_ids = [aws_security_group.allow-ssh.id]
    availability_zone  =  var.avail_zone
    associate_public_ip = true
    key_name = aws_key_pair.mykeypair.key_name
    user_data = file("lamp-server.sh")

  tags = {
    Name = "${var.env-prefix}-webserver"
  }
}


