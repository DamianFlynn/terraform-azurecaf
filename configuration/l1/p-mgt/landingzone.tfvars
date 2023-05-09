landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "launchpad"
  level               = "level1"
  key                 = "mgt-logs"
  tfstates = {
    launchpad = {
      level   = "lower"
      tfstate = "state.tfstate"
    }
  }
}
