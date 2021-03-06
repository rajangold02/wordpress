resource "aws_instance" "ebizon" {
  ami                         = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.Key_Name}"
  subnet_id                   = "subnet-6931a423"
  security_groups             = ["${aws_security_group.allow.id}"]
  associate_public_ip_address = "true"

  tags {
    Name = "Ebizon"
  }

  user_data = "${file("./module/ec2/wordpress.sh")}"
}

resource "aws_security_group" "allow" {
  vpc_id      = "${var.vpc_id}"
  name        = "allow-ec2-Access"
  description = "security group that allows ssh,http and all egress traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["210.18.176.193/32"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["210.18.176.193/32"]
  }

  tags {
    Name = "allow"
  }
}
