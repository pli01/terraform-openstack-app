# output
locals {
  bastion_private_ip    = flatten(module.bastion[*].private_ip)
  bastion_id            = flatten(module.bastion[*].id)
  http_proxy_private_ip = flatten(module.http_proxy[*].private_ip)
  http_proxy_id         = flatten(module.http_proxy[*].id)
  app_private_ip        = flatten(module.app[*].private_ip)
  app_id                = flatten(module.app[*].id)
  app_public_ip         = flatten(module.base[*].app_address)
  log_private_ip        = flatten(module.log[*].private_ip)
  log_id                = flatten(module.log[*].id)
  log_public_ip         = flatten(module.base[*].log_address)

}

output "bastion_id" {
  value = local.bastion_id
}
output "bastion_private_ip" {
  value = local.bastion_private_ip
}
output "bastion_public_ip" {
  value = module.base.bastion_address
}

output "http_proxy_id" {
  value = local.http_proxy_id
}
output "http_proxy_private_ip" {
  value = local.http_proxy_private_ip
}
output "http_proxy_public_ip" {
  value = module.base.http_proxy_address
}

output "app_id" {
  value = local.app_id
}
output "app_private_ip" {
  value = local.app_private_ip
}
output "app_public_ip" {
  value = local.app_public_ip
}

output "log_id" {
  value = local.log_id
}
output "log_private_ip" {
  value = local.log_private_ip
}
output "log_public_ip" {
  value = local.log_public_ip
}
