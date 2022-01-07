resource "aws_elb" "my-elb" {
    name            = "my-elb"
    subnets         = [aws_subnets.public-1.id, aws_subnet.main-public-2.id]
    security_groups = [aws_security_group.elb-securitygroup.id]
    listener {
        instance_port = 80
        instance_protocol = "http"
        lb_port           = 80
        lb_protocol         = "http"
    }


    health_check {
        healthy_thershold       = 2
        unhealthty_thershold    = 2
        timeout                 = 3
        target                  = "http;80"
        interval                = 30
    }


    cross_zone_load_balancing       = true
    connection_draining             = true
    connection_draining_timeout     = 400

    tags    = {
        Name = "my-elb"
    }
}

