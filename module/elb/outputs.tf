output "address" {
  value = "${aws_elb.example.dns_name}"
}
output "elbsg_id" {
  value = "${aws_security_group.elb.id}"
}