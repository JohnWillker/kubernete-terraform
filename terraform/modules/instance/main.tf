resource "aws_instance" "instance" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  user_data     = "${var.user_data}"
  count         = "${var.count}"

  #vpc_security_group_ids = [
  #  "${aws_security_group.k8s-ssh.id}",
  #]

  tags = "${map("Name", "${var.name}")}"

  lifecycle {
    create_before_destroy = true
  }
}
