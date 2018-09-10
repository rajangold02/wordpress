variable "instance_class" {
        description = "Type of instance"
        default = "db.t2.micro"
}
variable "vpc_id" {
  default = "vpc-881a21f3"
}
variable "instancesg_id" {}