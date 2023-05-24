#
role_mapping = {
  custom_role_mapping = {}

  built_in_role_mapping = {
    aks_clusters = {
      aks_region1_custer = {
        "Azure Kubernetes Service RBAC Cluster Admin" = {
          # azuread_groups = {
          #   keys = ["aks_admins"]
          # }
          logged_in = {
            keys = ["user"]
          }
          managed_identities = {
            keys = ["aks_jumpbox"]
          }
        }
      }
    }
    azure_container_registries = {
      acr_region1 = {
        # lz_key = "" to be defined when the keyvault is created in a different lz
        lz_key = "acr-region1"
        "AcrPull" = {
          aks_clusters = {
            # lz_key = "" to be defined when the msi is created in a different lz
            keys = ["aks_region1_custer"]
          }
        }
      }
    }
  }
}