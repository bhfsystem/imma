variable "consul_dc" {
  default = "dc1"
}

provider "consul" {
  datacenter = "${var.consul_dc}"
}

provider "aws" {}

data "aws_region" "current" {
  current = true
}
