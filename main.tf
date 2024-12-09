resource "oci_containerengine_addon" "addon" {
  addon_name = var.addon_name
  cluster_id = var.cluster_id
  remove_addon_resources_on_delete = var.remove_addon_resources_on_delete
  dynamic "configurations" {
    for_each = var.configurations != null ? var.configurations : []
    content {
      key = configurations.value.key
      value = configurations.value.value
    }
  }
  override_existing = var.override_existing
  version = var.addon_version
}