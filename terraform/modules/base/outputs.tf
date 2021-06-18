output "network_id" {
  value = openstack_networking_network_v2.generic.id
}
output "subnet_id" {
  value = openstack_networking_subnet_v2.worker.id
}
output "root_volume_id" {
  value = openstack_blockstorage_volume_v2.root_volume.id
}
output "servergroup_id" {
  value = openstack_compute_servergroup_v2.sg.id
}

# bastion
output "bastion_id" {
  value = openstack_networking_floatingip_v2.bastion.id
}
output "bastion_address" {
  value = openstack_networking_floatingip_v2.bastion.address
}
output "bastion_secgroup_id" {
  value = openstack_networking_secgroup_v2.bastion_secgroup_1.id
}

# http_proxy
output "http_proxy_id" {
  value = openstack_networking_floatingip_v2.http_proxy.id
}
output "http_proxy_address" {
  value = openstack_networking_floatingip_v2.http_proxy.address
}
output "http_proxy_secgroup_id" {
  value = openstack_networking_secgroup_v2.http_proxy_secgroup_1.id
}

# app
output "app_secgroup_id" {
  value = openstack_networking_secgroup_v2.app_secgroup_1.id
}

# app
output "app_id" {
  value = openstack_networking_floatingip_v2.app[*].id
}
output "app_address" {
  value = openstack_networking_floatingip_v2.app[*].address
}
# log
output "log_secgroup_id" {
  value = openstack_networking_secgroup_v2.log_secgroup_1.id
}

# log
output "log_id" {
  value = openstack_networking_floatingip_v2.log[*].id
}
output "log_address" {
  value = openstack_networking_floatingip_v2.log[*].address
}
