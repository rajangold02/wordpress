output "server_id" {
  value = "${aws_instance.ebizon.id}"
}

output "public_dns" {
  value = "${aws_instance.ebizon.public_dns}"
}

output "public_ip" {
  value = "${aws_instance.ebizon.public_ip}"
}

output "instancesg_id" {
  value = "${aws_security_group.allow.id}"
}
