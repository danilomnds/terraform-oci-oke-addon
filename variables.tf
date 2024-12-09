variable "addon_name" {
  type    = string
}

variable "cluster_id" {
  type    = string  
}

variable "remove_addon_resources_on_delete" {
  type = bool
  default = true  
}

variable "configurations" {
  type = list(object({
    key = optional(string)
    value = optional(string)
  }))
  default = null
}

variable "override_existing" {
  type = bool
  default = false
}

variable "addon_version" {
  type = string
  default = null  
}