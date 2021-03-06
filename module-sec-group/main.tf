resource "aws_security_group" "https" {
  name        = "allow_https"
  description = "Allow all https traffic"
  vpc_id      = "vpc-345df852"

}

resource "aws_security_group_rule" "allow_all" {
  type            = "ingress"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  cidr_blocks     = ["86.180.132.162/32"]
  security_group_id = "sg-0a5f93d20656c663a"
  depends_on = ["aws_security_group.https"]
  }