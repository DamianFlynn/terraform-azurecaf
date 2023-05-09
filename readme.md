# Terraform Framework

> Target
>
> Tenant: Innofactor Norway Hack 3
> Subscripions
>  - b4e6ba46-404a-408e-a3f3-475b5f0f482d :: p-iac
>  - 7f798b1d-5b09-491f-82e1-5aed7d81f8c1 :: p-gov

## Authenticate

Begin by logging into your target tenant

```bash
rover login -t InnoNorgeHack3.onmicrosoft.com
``
`
##

```bash
rover \
  -lz /tf/caf/framework/component/launchpad \
  -var-folder /tf/caf/framework/configuration/l0/p-iac-state/ \
  -tfstate_subscription_id b4e6ba46-404a-408e-a3f3-475b5f0f482d \
  -target_subscription b4e6ba46-404a-408e-a3f3-475b5f0f482d \
  -tfstate state.tfstate \
  -launchpad \
  -env alpha \
  -level level0 \
  -p ${TF_DATA_DIR}/state.tfstate.tfplan \
  -a plan
```


```bash
rover \                                                                  
  -lz /tf/caf/acf/platform/workloads \
  -var-folder /tf/caf/acf/landingzones/l2/vnet_hub \
  -tfstate_subscription_id b4e6ba46-404a-408e-a3f3-475b5f0f482d \
  -target_subscription 7f798b1d-5b09-491f-82e1-5aed7d81f8c1 \
  -tfstate vnet_hub.tfstate \
  -env orion \
  -level level2 \
  -w tfstate \
  -p ${TF_DATA_DIR}/vnet_hub.tfstate.tfplan \
  -a apply
```