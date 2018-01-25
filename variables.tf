variable "hosts" {
  default = 3
}

variable "domain" {
  default = "howsthesnow.io"
}

variable "hostname_format" {
  default = "kube-%s-%d"
}

variable "digitalocean_region" {
  default = "sfo2"
}

variable "digitalocean_ssh_keys" {
  type = "list"
  default = ["17520702", "17790492"]
}

variable "digitalocean_token" {
  default = "153076eac53e48f5290256f86f03c99eccd04adf425684ffbfdf57e3d7ce222e"
}
