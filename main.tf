module "provider" {
  source = "./provider"
  hostname_format = "${var.hostname_format}"
  token = "${var.digitalocean_token}"
  ssh_keys = "${var.digitalocean_ssh_keys}"
  region = "${var.digitalocean_region}"
}