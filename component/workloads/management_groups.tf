module "management_groups" {
  source = "./modules/management_groups"
  for_each = {
    for key, value in try(var.management_groups, {}) : key => value
    if try(value.reuse, false) == false
  }

  management_group_name = each.value.name
  settings            = each.value
  display_name = each.value.displayName
  parent_id = try(var.management_groups[each.value.parent_key].parent_key, null)
  global_settings     = local.global_settings
}


locals {
  # management_groups = merge(module.management_groups, module.management_group_reused)
  management_groups = merge(module.management_groups)
}

output "management_groups" {
  value = local.management_groups
}