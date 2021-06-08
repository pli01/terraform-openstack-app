variable "fip" {}

variable "network" {}
variable "subnet" {}
variable "source_volid" {}

variable "security_group" {}

variable "maxcount" {
  type    = number
  default = 1
}
variable "prefix_name" {
}


#### GLANCE
variable "image" {
  type    = string
  default = "debian-latest"
}

variable "vol_type" {
  type    = string
  default = "default"
}

#### VM parameters ####
variable "key_name" {
  type    = string
  default = "debian"
}

variable "flavor" {
  type    = string
  default = "t1.small"
}

#### Variable used in heat and cloud-init
variable "no_proxy" {}
variable "ssh_authorized_keys" {
  type    = list(string)
  default = []
}
variable "tinyproxy_upstream" {
  default = []
}
variable "tinyproxy_proxy_authorization" {
  default = ""
}
variable "internal_http_proxy" {
  default = ""
}
variable "dns_nameservers" {
  default = ""
}
variable "dns_domainname" {
  default = ""
}
variable "nexus_server" {
  default = ""
}
variable "mirror_docker" {
  default = ""
}
variable "mirror_docker_key" {
  default = ""
}
variable "docker_version" {
  default = ""
}
variable "docker_compose_version" {
  default = ""
}
variable "dockerhub_login" {}
variable "dockerhub_token" {}
variable "github_token" {}
variable "docker_registry_username" {}
variable "docker_registry_token" {}
variable "app_install_script" {}
variable "app_variables" {
    type = map
    default = {}
}
