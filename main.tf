provider "aws" {
  region     = "us-east-1"
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
		instancesg_id = "${module.ec2.instancesg_id}"
}

module "ec2" {
        source = "./module/ec2"
		elbsg_id = "${module.elb.elbsg_id}"
}

module "elb" {
        source = "./module/elb"
		server_id = "${module.ec2.server_id}"
}
