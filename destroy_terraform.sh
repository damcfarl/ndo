#/bin/bash

## deploy working in NDO 4.1.2e
cd 5-deploy_template
echo "Current Directory: " 
pwd
terraform destroy -auto-approve
cd ../
sleep 2

cd 4-add_sites_to_template
echo "Current Directory: " 
pwd
terraform destroy -auto-approve -parallelism=1
cd ../
sleep 2

cd 3-application_policies
echo "Current Directory: " 
pwd
terraform destroy -auto-approve
cd ../
sleep 2

cd 2-Network-Contract_polices
echo "Current Directory: " 
pwd
terraform destroy -auto-approve
cd ../
sleep 2

cd 1-create_tenant
echo "Current Directory: " 
pwd
terraform destroy -auto-approve -parallelism=1
cd ../

./reset.sh


## Run this after you destroy the config
## Otherwise, you'll see apply errors

#for file in `find . | grep terraform.tf*`
#do
#  ls $file
#  rm $file
#done
