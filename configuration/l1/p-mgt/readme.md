```bash
rover \
  -lz /tf/caf/acf/platform/workloads \
  -var-folder /tf/caf/acf/landingzones/level1/mgt-landingzone \
  -tfstate_subscription_id 7f798b1d-5b09-491f-82e1-5aed7d81f8c1 \
  -target_subscription f6b3f099-986b-4a79-b829-e7a38b86b361 \
  -tfstate mgt_logs.tfstate \
  -env sandpit \
  -level level1 \
  -w tfstate \
  -p ${TF_DATA_DIR}/mgt_logs.tfstate.tfplan \
  -a plan

## Using this....

rover \
  -lz /tf/caf/framework/component/launchpad \
  -var-folder /tf/caf/framework/configuration/l1/p-mgt/ \
  -tfstate_subscription_id 6bf8037f-4ed7-4adf-b1a3-e09efbcc2b3c \
  -target_subscription a807b50a-70fd-4c19-9ad7-b39226d231f3 \
  -tfstate mgt_logs.tfstate \
  -w tfstate \
  -env power \
  -level level1 \
  -p ${TF_DATA_DIR}/mgt_logs.tfstate.tfplan \
  -a plan

```


Architecture


* Subscription: p-mgt
  * Resource Group: p-mgt-logs
    * 