variable "env_name" {}

variable "az_count" {}

variable "nat_count" {
  default = "0"
}

variable "nat_bits" {
  default = "12"
}

variable "common_bits" {
  default = "8"
}

variable "env_zone" {
  default = ""
}

variable "env_domain_name" {
  default = ""
}

variable "want_fs" {
  default = "1"
}

output "vpc_id" {
  value = "${aws_vpc.env.id}"
}

output "igw_id" {
  value = "${aws_internet_gateway.env.id}"
}

output "private_zone_id" {
  value = "${aws_route53_zone.private.zone_id}"
}

output "private_zone_servers" {
  value = "${aws_route53_zone.private.name_servers}"
}

output "private_zone_name" {
  value = "${lookup(map("1",var.env_zone,"0",var.env_name),format("%d",signum(length(var.env_zone))))}.${lookup(map("1",var.env_domain_name,"0",data.terraform_remote_state.global.domain_name),format("%d",signum(length(var.env_domain_name))))}"
}

output "sg_efs" {
  value = "${module.fs.efs_sg}"
}

output "sg_env" {
  value = "${aws_security_group.env.id}"
}

output "sg_env_private" {
  value = "${aws_security_group.env_private.id}"
}

output "sg_env_public" {
  value = "${aws_security_group.env_public.id}"
}

output "sg_env_lb" {
  value = "${aws_security_group.env_lb.id}"
}

output "sg_env_lb_private" {
  value = "${aws_security_group.env_lb_private.id}"
}

output "sg_env_lb_public" {
  value = "${aws_security_group.env_lb_public.id}"
}

output "nat_gateways" {
  value = ["${aws_nat_gateway.env.*.id}"]
}

output "env_name" {
  value = "${var.env_name}"
}
