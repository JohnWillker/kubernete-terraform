# Security Group

resource "aws_security_group" "security_group" {
  count = "${var.create ? 1 : 0}"
  name        = "${var.name}"
  vpc_id      = "${var.vpc_id}"
  description = "${var.description}"

  #TODO apply tags support
  #tags   = "${map(local.kube_cluster_tag, "shared")}"

}

resource "aws_security_group_rule" "ingress" {
  count             = "${var.create ? length(var.ingress_rules) : 0}"
  description       = "${element(var.rules[var.ingress_rules[count.index]], 3)}"
  type              = "ingress"

  security_group_id = "${aws_security_group.security_group.id}"
  cidr_blocks       = ["${var.ingress_cidr_blocks}"]

  from_port = "${element(var.rules[var.ingress_rules[count.index]], 0)}"
  to_port   = "${element(var.rules[var.ingress_rules[count.index]], 1)}"
  protocol  = "${element(var.rules[var.ingress_rules[count.index]], 2)}"
}
