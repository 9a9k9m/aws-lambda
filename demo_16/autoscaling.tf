resource "aws_launch_configuration" "example-launchconfig" {
    name_prefix         = "example-launchingconfig"
    image_id            = var.AMIS[var.AWS_REGION]
    instance_type       = "t2.micro"
    key_name            = aws_key_pair.mysonykey.key-name
    security_groups     = [aws_security_group.instance-sg.id]
    user_data           = "#!/bin/bash\napt-get update\napt-get -y install net-tools nginx\nMYIP='ifconfig | grep -E '(inet 10) | (addr:10)' | awk ' { print $2 }' | cut -d ':' -f2'\necho ' this is : '$MYIP > /var/www/html/index.html"
    lifecycle {
        create_before_destroy = true
    }
}


resource "aws_autoscaling_group" "example-autoscaling" {
    name                        = "example-autoscaling"
    vpc_zone_identifier         = [aws_subnet.public-1.id, aws_subnet.public-2.id]
    launch_configuration        = aws_launch_configuration.example-launch_configuration.name
    min_size                    = 2
    max_size                    = 3
    health_check_grace_period   = 60
    health_check_type           = "ELB"
    load_balancers              = [aws_elb.my-elb.name]
    force_delete                = true


    tags {
        key                     = "Name"
        value                   = "ec2-instance"
        propagate_at_launch     = true
    }
}