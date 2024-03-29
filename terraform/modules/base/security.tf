# bastion
resource "openstack_networking_secgroup_v2" "bastion_secgroup_1" {
  name        = format("%s-%s", var.prefix_name, "bastion_secgroup_1")
  description = "Bastion security group"
  #delete_default_rules = true
}

resource "openstack_networking_secgroup_rule_v2" "ssh_bastion_bastion_secgroup_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = var.ssh_access_cidr
  security_group_id = openstack_networking_secgroup_v2.bastion_secgroup_1.id
}

resource "openstack_networking_secgroup_rule_v2" "ssh_worker_bastion_secgroup_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = var.network_worker["cidr"]
  security_group_id = openstack_networking_secgroup_v2.bastion_secgroup_1.id
}

# http_proxy
resource "openstack_networking_secgroup_v2" "http_proxy_secgroup_1" {
  name        = format("%s-%s", var.prefix_name, "http_proxy_secgroup_1")
  description = "http_proxy security group"
  #delete_default_rules = true
}


resource "openstack_networking_secgroup_rule_v2" "ssh_worker_http_proxy_secgroup_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = var.network_worker["cidr"]
  security_group_id = openstack_networking_secgroup_v2.http_proxy_secgroup_1.id
}

resource "openstack_networking_secgroup_rule_v2" "proxy_worker_http_proxy_secgroup_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8888
  port_range_max    = 8888
  remote_ip_prefix  = var.network_worker["cidr"]
  security_group_id = openstack_networking_secgroup_v2.http_proxy_secgroup_1.id
}

# app
resource "openstack_networking_secgroup_v2" "app_secgroup_1" {
  name        = format("%s-%s", var.prefix_name, "app_secgroup_1")
  description = "app security group"
  #delete_default_rules = true
}

resource "openstack_networking_secgroup_rule_v2" "ssh_worker_app_secgroup_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = var.network_worker["cidr"]
  security_group_id = openstack_networking_secgroup_v2.app_secgroup_1.id
}

# Add http to app
resource "openstack_networking_secgroup_rule_v2" "http_worker_app_secgroup_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.app_secgroup_1.id
}

# log
resource "openstack_networking_secgroup_v2" "log_secgroup_1" {
  name        = format("%s-%s", var.prefix_name, "log_secgroup_1")
  description = "log security group"
  #delete_default_rules = true
}

resource "openstack_networking_secgroup_rule_v2" "ssh_worker_log_secgroup_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = var.network_worker["cidr"]
  security_group_id = openstack_networking_secgroup_v2.log_secgroup_1.id
}

# Add http to log
resource "openstack_networking_secgroup_rule_v2" "http_worker_log_secgroup_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.log_secgroup_1.id
}

# Add syslog to log
resource "openstack_networking_secgroup_rule_v2" "syslog_tcp_worker_log_secgroup_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 514
  port_range_max    = 514
  #remote_ip_prefix  = var.network_worker["cidr"]
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.log_secgroup_1.id
}

# Add syslog to log
resource "openstack_networking_secgroup_rule_v2" "syslog_udp_worker_log_secgroup_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 514
  port_range_max    = 514
  #remote_ip_prefix  = var.network_worker["cidr"]
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.log_secgroup_1.id
}

# lb
resource "openstack_networking_secgroup_v2" "lb_secgroup_1" {
  name        = format("%s-%s", var.prefix_name, "lb_secgroup_1")
  description = "lb security group"
  #delete_default_rules = true
}

# add ssh to lb
resource "openstack_networking_secgroup_rule_v2" "ssh_worker_lb_secgroup_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = var.network_worker["cidr"]
  security_group_id = openstack_networking_secgroup_v2.lb_secgroup_1.id
}

# Add http to lb
resource "openstack_networking_secgroup_rule_v2" "http_worker_lb_secgroup_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.lb_secgroup_1.id
}


