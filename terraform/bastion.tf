module "bastion" {
  source              = "./modules/bastion"
  maxcount            = var.bastion_count
  prefix_name         = var.prefix_name
  fip                 = module.base.bastion_id
  network             = module.base.network_id
  subnet              = module.base.subnet_id
  source_volid        = module.base.root_volume_id
  security_group      = module.base.bastion_secgroup_id
  vol_type            = var.vol_type
  flavor              = var.bastion_flavor
  image               = var.image
  key_name            = var.key_name
  no_proxy            = var.no_proxy
  ssh_authorized_keys = var.ssh_authorized_keys
  depends_on = [
    module.base
  ]
}
