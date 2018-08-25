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
        sourece = "./module/ec2"
}