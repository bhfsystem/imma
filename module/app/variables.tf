variable "app_name" {}

variable "az_count" {}

output "app_sg" {
  value = "${aws_security_group.app.id}"
}
