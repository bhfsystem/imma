data "consul_keys" "app" {
  key {
    name    = "irssi_nets"
    path    = "app/${var.app_name}/irssi/nets"
    default = "102 103 104"
  }
}

module "app" {
  source              = "../../fogg/app"
  global_remote_state = "${var.global_remote_state}"
  env_remote_state    = "${var.sandbox_remote_state}"
  az_count            = "${var.az_count}"
  app_name            = "${var.app_name}"
}

module "irssi" {
  source              = "../../fogg/service"
  global_remote_state = "${var.global_remote_state}"
  env_remote_state    = "${var.sandbox_remote_state}"
  az_count            = "${var.az_count}"
  app_name            = "${var.app_name}"
  service_name        = "irssi"
  service_nets        = ["${split(" ",data.consul_keys.app.var.irssi_nets)}"]
  security_groups     = ["${module.app.app_sg}"]
  public_network      = "1"
  instance_type       = ["${var.instance_type}"]
  user_data           = "${var.user_data}"
}
