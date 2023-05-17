keyvaults = {
  aks_jumpbox = {
    name                = "p-we1k8s-jump-box01-kv"
    resource_group_key  = "aks_jumpbox"
    sku_name            = "premium"
    soft_delete_enabled = true
    purge_protection_enabled    = false
    enabled_for_disk_encryption = true

    creation_policies = {
      logged_in_user = {
        # if the key is set to "logged_in_user" add the user running terraform in the keyvault policy
        # More examples in /examples/keyvault
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
      # aks_admins = {
      #   azuread_group_key  = "aks_admins"
      #   secret_permissions = ["Get", "List"]
      # }
    }

    # # you can setup up to 5 profiles
    # diagnostic_profiles = {
    #   operations = {
    #     definition_key   = "default_all"
    #     destination_type = "log_analytics"
    #     destination_key  = "central_logs"
    #   }
    # }

  }
}