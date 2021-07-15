# 
resource "openstack_blockstorage_volume_v2" "bastion-data_volume" {
  count = var.bastion_data_enable ? var.bastion_count : 0
  name        = format("%s-%s-%s-%s", var.prefix_name, "bastion", count.index + 1, "data-volume")
  size        = var.vol_size
  volume_type = var.vol_type
}
#resource "openstack_blockstorage_volume_v2" "app-data_volume" {
#  count = var.app_count
#  name        = format("%s-%s-%s-%s", var.prefix_name, "app", count.index + 1, "data-volume")
#  size        = var.vol_size
#  volume_type = var.vol_type
#}
resource "openstack_blockstorage_volume_v2" "log-data_volume" {
  count = var.log_count
  name        = format("%s-%s-%s-%s", var.prefix_name, "log", count.index + 1, "data-volume")
  size        = var.vol_size
  volume_type = var.vol_type
}
