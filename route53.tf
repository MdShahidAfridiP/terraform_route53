resource "aws_route53_zone" "route_aws" {
  name = "cloudthat.ml"

  tags = {
    Environment = "dev"
  }
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.route_aws.zone_id
  name    = "www.cloudthat.ml"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.example1.public_ip]
}

output "name_server"{
  value=aws_route53_zone.route_aws.name_servers
}
