module "provider" {
  source = "./provider"
  hostname_format = "${var.hostname_format}"
  token = "${var.digitalocean_token}"
  ssh_keys = "${var.digitalocean_ssh_keys}"
  region = "${var.digitalocean_region}"
}

module "wireguard" {
  source = "./security/wireguard"
  count       = "${var.hosts}"
  connections = "${module.provider.public_ips}"
  private_ips = "${module.provider.private_ips}"
  hostnames   = "${module.provider.hostnames}"
}
