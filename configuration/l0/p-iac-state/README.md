
# Terraform State Managment

This is the launch pad for any azure framework component, to correctly work with the state management system

## Configuration

|Workload|level|subscription|state file|key|folder|
|---|---|---|---|---|---|
|state management|0|p-iac|state|state|l0\p-iac-state|

## Dependencies

Owner on Subsription to be used as `p-iac`


### Launchpad

```bash
# Login to the subscription p-mgt with the user damian.flynn_innofactor.com#EXT#@InnoNorgeHack3.onmicrosoft.com
rover login -t InnoNorgeHack3.onmicrosoft.com -s b4e6ba46-404a-408e-a3f3-475b5f0f482d


rover \
  -lz /tf/caf/framework/component/launchpad \
  -var-folder /tf/caf/framework/configuration/l0/p-iac-state \
  -tfstate_subscription_id b4e6ba46-404a-408e-a3f3-475b5f0f482d \
  -target_subscription b4e6ba46-404a-408e-a3f3-475b5f0f482d \
  -tfstate state.tfstate \
  -launchpad \
  -env orion \
  -level level0 \
  -p ${TF_DATA_DIR}/state.tfstate.tfplan \
  -a plan
```




## Payload

* Subscription: p-iac
  * ResourceGroups: p-iac-statelevel0
  * ResourceGroups: p-iac-statelevel1
  * ResourceGroups: p-iac-statelevel2
  * ResourceGroups: p-iac-statelevel3
  * ResourceGroups: p-iac-statelevel4
  * ResourceGroups: p-iac-network
    * virtualNetwork: p-iac-network-vnet
      - address_space = ["10.101.10.0/24", "10.101.8.0/23"]
        subnets:
        * level0:
          - cidr: "10.101.10.0/27"
          - enforce_private_link_endpoint_network_policies = true
        * level1:
          - cidr: "10.101.10.32/27"
          - enforce_private_link_endpoint_network_policies = true
        * level2:
          - cidr: "10.101.10.64/27"
          - enforce_private_link_endpoint_network_policies = true
        * level3:
          - cidr: "10.101.10.96/27"
          - enforce_private_link_endpoint_network_policies = true
        * level4:
          - cidr: "10.101.10.128/27"
          - enforce_private_link_endpoint_network_policies = true
        * credentials:
          - cidr: "10.101.10.160/27"
          - enforce_private_link_endpoint_network_policies = true
        * gitops:
          - cidr: "10.101.10.192/27"
          - enforce_private_link_endpoint_network_policies = true
        * runners:
          - cidr    = ["10.101.8.0/23"]
          - nsg_key = "empty_nsg"
      

## Pre-requisites

This scenario require the following privileges:

| Component          | Privileges         |
|--------------------|--------------------|
| Active Directory   | None               |
| Azure subscription | Subscription owner |

## Deployment

```bash
rover -lz /tf/caf/caf_launchpad \
  -launchpad \
  -var-folder /tf/caf/caf_launchpad/scenario/100 \
  -env <name of environment> \
  -a plan

rover -lz /tf/caf/caf_launchpad \
  -launchpad \
  -var-folder /tf/caf/caf_launchpad/scenario/100 \
  -env <name of environment> \
  -a destroy
```

## Architecture diagram
![Launchpad 100](../../documentation/img/launchpad-100.PNG)

## Services deployed in this scenario

| Component             | Purpose                                                                                                                                                                                                                    |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Resource group        | Multiple resource groups are created to isolate the services.                                                                                                                                                              |
| Storage account       | A storage account for remote tfstate management is provided for each level of the framework. Additional storage accounts are created for diagnostic logs.                                                                  |
| Key Vault             | The launchpad Key Vault hosts all secrets required by the rover to access the remote states, the Key Vault policies are created allowing the logged-in user to see secrets created and stored.                             |
| Virtual network       | To secure the communication between the services a dedicated virtual network is deployed with a gateway subnet, bastion service, jumpbox and azure devops release agents. Service endpoints is enabled but not configured. |
| Azure AD Applications | An Azure AD application is created. This account is mainly use to bootstrap the services during the initialization. It is also considered as a breakglass account for the launchpad landing zones                          |
