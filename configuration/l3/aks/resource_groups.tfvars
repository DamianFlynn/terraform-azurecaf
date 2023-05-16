resource_groups = {
  aks = {
    name        = "p-we1k8s"
    region      = "region1"
    description = "Resource Group for the AKS"
  }
  aks_vnet = {
    name        = "p-we1k8s-network"
    region      = "region1"
    description = "Resource Group for the vNET, hosting the AKS"
  }

}