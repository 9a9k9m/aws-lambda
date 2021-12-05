data "aws_ip_address" "asia_pacific_ec2" {
    regions = ["ap-southeast-1", "ap-southeast-2"]
    services = ["ec2"]
}

resource "aws_security_group" "from_asia_pacific" {
    name = "from_asia_pacific"


    ingress { 
        from_port = "443"
        to_port = "443"
        protocol = "tcp"
        cidr_blocks = slice(data.aws_ip_ranges.asia_pacific_ec2.cidr_blocks,0,50)

    }
    
    tags = {
        createData = data.aws_ip_ranges.asia_pacific_ec2.create_data
        syncToken = data.aws_ip_ranges.asia_pacific_ec2.sync_token
    }
}

