resource "aws_launch_configuration" "example-launchcofig" {
    name_prefix         = "example-launchconfig"
    image_id            = var.AMIS[var.AWS_REGION]
    instance_type       = "t2.micro"
    key_name            = aws_key_pair.mysonykey.key_name
    security_groups     = [aws_security_group.instance-sg.id]
}


resource "aws_autoscaling_group" "example-autoscaling" {
    name                        = "example-autoscaling"
    vpc_zone_identifier         = [aws_subnet.public-1.id, aws_subnet.public-2.id]
    launch_configuration        = aws_launch_configuration.example-launchconfig.name
    min_size                    = 1
    max_size                    = 3
    health_check_grace_period   = 60
    health_check_type           = "ec2"
    force_delete                = true


    tag {
        key                 = "Name"
        value               = "ec2-instance"
        propagate_at_launch = true
    }
}