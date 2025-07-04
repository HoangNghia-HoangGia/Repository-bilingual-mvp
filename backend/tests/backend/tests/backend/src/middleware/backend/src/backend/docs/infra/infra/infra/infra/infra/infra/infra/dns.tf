resource "aws_route53_zone" "zone" {
  name = var.domain_name
  tags = var.common_tags
}

resource "aws_route53_record" "app" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.cdn.domain_name
    zone_id                = aws_cloudfront_distribution.cdn.hosted_zone_id
    evaluate_target_health = false
  }
}
