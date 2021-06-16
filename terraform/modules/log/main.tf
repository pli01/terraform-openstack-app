#### Heat CONFIGURATION ####
# create heat stack
resource "openstack_orchestration_stack_v1" "log" {
  count = var.maxcount
  name  = format("%s-%s-%s", var.prefix_name, "log", count.index + 1)
  # override heat parameters
  parameters = {
    floating_ip_id  = element(var.fip, count.index)
    security_group  = var.security_group
    worker_network  = var.network
    worker_subnet   = var.subnet
    source_volid    = var.source_volid
    worker_vol_type = var.vol_type
    worker_flavor   = var.flavor
    key_name        = var.key_name
    user_data       = data.cloudinit_config.log_config.rendered
  }
  # override heat parameters with param files
  environment_opts = {
    Bin = "\n"
    # Bin = file("heat/log-param.yaml")
  }
  # define heat file
  template_opts = {
    Bin = file("${path.module}/../../heat/log.yaml")
    # Bin = file("${path.root}/heat/log.yaml")
    #Bin = file("${path.cwd}/heat/log.yaml")
  }
  disable_rollback = true
  #  disable_rollback = false
  timeout = 30
}

