landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "settings"
  level               = "level3"
  key                 = "devcenter-region1"
  tfstates = {
    net-hub-region1 = {
      level   = "lower"
      tfstate = "net-hub-region1.tfstate"
    }
  }
}
