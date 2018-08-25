output "address" {
  value = "${aws_elb.ebizon.dns_name}"
}