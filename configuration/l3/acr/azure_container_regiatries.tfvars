azure_container_registries = {
  acr_region11 = {
    name               = "p-we1acr-pwr-cr"
    resource_group_key = "acr_region1"
    sku                = "Premium"

    #public_network_access_enabled = "false" #Only able to control when sku = "premium"

    # diagnostic_profiles = {
    #   operations = {
    #     name             = "acr_logs"
    #     definition_key   = "azure_container_registry"
    #     destination_type = "log_analytics"
    #     destination_key  = "central_logs"
    #   }
    # }

    georeplications = {
      region2 = {
        tags = {
          region = "northeurope"
          type   = "acr_replica"
        }
      }
      # region3 = {
      #   tags = {
      #     region = "westeurope"
      #     type   = "acr_replica"
      #   }
      # }
    }

    network_rule_set = {
      rule1 = {
        default_action = "Allow"
        # ip_rules = {
        #   rule1 = {
        #     ip_range = [""]
        #   }
        # }
        virtual_networks = {
          acr1_jumphost = {
            vnet_key   = "acr_region1_vnet"
            subnet_key = "jumpbox_subnet"
          }
        }
      }
    }

    private_endpoints = {
      # This needs to be using the main DNS so node pools can resolve the address
      acr_region1_jumphost = {
        name               = "acr-region1-private-link"
        resource_group_key = "acr_region1_vnet"
        vnet_key           = "acr_region1_vnet"
        subnet_key         = "jumpbox_subnet"
        private_service_connection = {
          name                 = "acr-private-link"
          is_manual_connection = false
          subresource_names    = ["registry"]
        }
      }

    }
  }

}