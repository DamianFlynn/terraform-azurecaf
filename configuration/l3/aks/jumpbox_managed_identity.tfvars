#
# IAM
#

managed_identities = {
  aks_jumpbox = {
    name               = "p-we1k8s-jump-box01-id"
    resource_group_key = "aks_jumpbox"
  }
}

