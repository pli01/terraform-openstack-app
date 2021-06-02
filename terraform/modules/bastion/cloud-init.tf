# bastion userdata
data "cloudinit_config" "bastion_config" {
  gzip          = false
  base64_encode = false

  # order matter
  # cloud-init.cfg
  part {
    filename     = "cloud-init.cfg"
    content_type = "text/cloud-config"
    content      = file("${path.module}/../../heat/config-scripts/cloud-init.tpl")
  }
  # config.cfg sourced in each script, and contains all needed variables
  part {
    content_type = "text/plain"
    content = templatefile("${path.module}/../../heat/config-scripts/config.cfg.tpl", {
      ssh_authorized_keys           = jsonencode(var.ssh_authorized_keys)
      no_proxy                      = var.no_proxy
      tinyproxy_upstream            = var.tinyproxy_upstream
      tinyproxy_proxy_authorization = var.tinyproxy_proxy_authorization
      internal_http_proxy           = var.internal_http_proxy
      dns_nameservers               = jsonencode(var.dns_nameservers)
      dns_domainname                = jsonencode(var.dns_domainname)
      nexus_server                  = var.nexus_server
      mirror_docker                 = var.mirror_docker
      mirror_docker_key             = var.mirror_docker_key
      docker_version                = var.docker_version
      docker_compose_version        = var.docker_compose_version
    })
  }
  part {
    content_type = "text/plain"
    content      = file("${path.module}/../../heat/config-scripts/worker_install_ssh_keys.sh")
  }
  # post conf
  part {
    content_type = "text/plain"
    content      = file("${path.module}/../../heat/config-scripts/worker_bastion_postconf.sh")
  }
}
