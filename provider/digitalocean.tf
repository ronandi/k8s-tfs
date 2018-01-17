variable "token" {}
variable "hosts" {
  default = 0
}
variable "hostname_format" {
  type = "string"
}
variable "ssh_keys" {
  type = "list"
}
variable "region" {
  default = "sfo2"
}
variable "image" {
  default = "ubuntu-16-04-x64"
}
variable "size" {
  default = "1gb"
}

provider "digitalocean" {
  token = "${var.token}"
}

resource "digitalocean_droplet" "host" {
  image = "${var.image}"
  name = "${format(var.hostname_format, var.region, count.index + 1)}"
  region = "${var.region}"
  size = "${var.size}"
  backups = false
  private_networking = true
  ssh_keys = "${var.ssh_keys}"
  count = "${var.hosts}"
}

output "hostnames" {
  value = ["${digitalocean_droplet.host.*.name}"]
}

output "public_ips" {
  value = ["${digitalocean_droplet.host.*.ipv4_address}"]
}

output "private_ips" {
  value = ["${digitalocean_droplet.host.*.ipv4_address_private}"]
}

output "private_network_interface" {
  value = "eth1"
}
