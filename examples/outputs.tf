output "bastion_id" {
  value = module.app-pool.bastion_id
}
output "bastion_private_ip" {
  value = module.app-pool.bastion_private_ip
}
output "bastion_public_ip" {
  value = module.app-pool.bastion_public_ip
}

output "http_proxy_id" {
  value = module.app-pool.http_proxy_id
}
output "http_proxy_private_ip" {
  value = module.app-pool.http_proxy_private_ip
}
output "http_proxy_public_ip" {
  value = module.app-pool.http_proxy_public_ip
}

output "app_id" {
  value = module.app-pool.app_id
}
output "app_private_ip" {
  value = module.app-pool.app_private_ip
}
output "app_public_ip" {
  value = module.app-pool.app_public_ip
}
