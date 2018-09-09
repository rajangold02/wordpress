provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}
terraform {
  backend "s3" {
    bucket = "wordpressterraform"
    key    = "key"
    region = "us-east-1"
  }
}
module "rds" {
        source = "./module/rds"
}

module "ec2" {
        source = "./module/ec2"
}

module "elb" {
        source = "./module/elb"
		server_id = "${module.ec2.server_id}"
}
