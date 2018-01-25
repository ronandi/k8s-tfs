module "provider" {
  source = "./provider"
  hostname_format = "${var.hostname_format}"
  token = "${var.digitalocean_token}"
  ssh_keys = "${var.digitalocean_ssh_keys}"
  region = "${var.digitalocean_region}"
  hosts = "${var.hosts}"
}

module "wireguard" {
  source = "./security/wireguard"
  count       = "${var.hosts}"
  connections = "${module.provider.public_ips}"
  private_ips = "${module.provider.private_ips}"
  hostnames   = "${module.provider.hostnames}"
}

module "firewall" {
  source = "./security/ufw"

  count                = "${var.hosts}"
  connections          = "${module.provider.public_ips}"
  private_interface    = "${module.provider.private_network_interface}"
  vpn_interface        = "${module.wireguard.vpn_interface}"
  vpn_port             = "${module.wireguard.vpn_port}"
}
