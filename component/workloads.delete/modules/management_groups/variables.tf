variable "global_settings" {
  description = "Global settings object (see module README.md)"
}

variable "settings" {}

variable "management_group_name" {
  description = "(Required) The name of the management group where to create the resource."
  type        = string
}

variable "display_name" {
  description = "(Required) The name of the management group where to create the resource."
  type        = string
}

variable "parent_id" {
  description = "(Required) The name of the management group where to create the resource."
  type        = string
}
