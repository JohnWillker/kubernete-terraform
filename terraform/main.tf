# TODO
# tags
# security_groups
# vpc

data "aws_vpc" "default" {
  default = true
}

module "ec2_instance" {
  source        = "./modules/instance"
  name          = "Instance"
  ami           = "ami-024a64a6685d05041"
  instance_type = "t2.micro"
  count         = 1
}

# call the module here
module "security_group" {
  source      = "./modules/security_group"
  name        = "web"
  vpc_id      = "${data.aws_vpc.default.id}"
  description = "Allow Http"

  ingress_cidr_blocks = ["0.0.0.0/0"]

  ingress_rules = ["http-80-tcp"]
}
