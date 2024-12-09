output "current_installed_version" {
  description = "current installed version of the addon"
  value       = oci_containerengine_addon.addon.current_installed_version
}

output "addon_name" {
  description = "The name of the addon"
  value       = oci_containerengine_addon.addon.addon_name
}

output "time_created" {
  description = "The time the cluster was created"
  value       = oci_containerengine_addon.addon.time_created
}

output "version" {
  description = "selected addon version, or null indicates autoUpdate"
  value       = oci_containerengine_addon.addon.version
}
