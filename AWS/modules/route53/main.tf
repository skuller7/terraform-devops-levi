data "aws_route53_zone" "root" {
    name = "skuller78.click"
}

# resource "aws_route53_zone" "dev" {
#   name = var.dev_recond_name

#   tags = {
#     Environment = "dev"
#   }
# }

# resource "aws_route53_record" "dev-ns" {
#   zone_id = var.domain_name.zone_id
#   name    = var.dev_recond_name
#   type    = "NS"
#   ttl     = "30"
#   records = aws_route53_zone.dev.name_servers
# }


# resource "aws_route53_record" "www" {
#   zone_id = data.aws_route53_zone.root.zone_id
#   name    = var.openvpn_recond_name
#   type    = "A"
#   ttl     = 300
#   records = [aws_eip.lb.public_ip]
# }

resource "aws_route53_record" "openvpn" {
  zone_id = data.aws_route53_zone.root.zone_id
  name = var.openvpn_recond_name
  type = "A"
  ttl = 300
  records = ["57.129.100.83"]
}