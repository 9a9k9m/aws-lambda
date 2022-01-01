resource "aws_route53_zone" "seven-square" {
    name = "sevensquare.com"
}

resource "aws_route53_record" "server1-record" {
    zone_id = aws_route53_zone.seven-square.zone_id
    name = "server1.sevensquare.com"
    type = "A"
    ttl = "60"
    records = ["10.0.3.0"]
}


resource "aws_route53_record" "www-record" {
    zone_id = aws_route53_zone.seven-square.zone_id
    name = "www.sevensquare.com"
    type = "A"
    ttl = "60"
    records = ["10.0.3.0"]
}

output "ns-servers" {
    value = aws_route53_zone.seven-square.name_servers
}