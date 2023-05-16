# Management Automation and Auditing



## Configuration

|Workload|level|subscription|state file|key|folder|
|---|---|---|---|---|---|
|management automation + auditing|1|p-mgt|management|management|l0\management|

# Depends

L0 - State Management


## Deployment

Deploy the management services

```bash
rover \
  -lz /tf/caf/acf/platform/workloads \
  -var-folder /tf/caf/framework/configuration/l2/p-we1net/ \
  -tfstate_subscription_id 6bf8037f-4ed7-4adf-b1a3-e09efbcc2b3c \
  -target_subscription a807b50a-70fd-4c19-9ad7-b39226d231f3 \
  -tfstate vnet_hub.tfstate \
  -env power \
  -level level2 \
  -w tfstate \
  -p ${TF_DATA_DIR}/vnet_hub.tfstate.tfplan \
  -a plan

```


# Next steps

When you have successfully deployed the management landing zone, you can move to the next step:

[Deploy Identity](../../level1/identity/readme.md)



```sh
```


Architecture


* Subscription: p-mgt
  * Resource Group: p-mgt-logs


