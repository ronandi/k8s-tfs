variable "hosts" {
  default = 3
}

variable "hostname_format" {
  default = "kube-%s-%d"
}

variable "digitalocean_region" {
  default = "sfo2"
}

variable "digitalocean_ssh_keys" {
  type = "list"
  default = ["17520702"]
}

variable "digitalocean_token" {
  default = ""
}
