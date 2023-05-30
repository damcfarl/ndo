Very brief instructions

This set of terrform HCL files have been tested on NDO 3.7.2h and 4.1.2e
Tested with mso provider 0.9.0 and 0.10.0

These files are used to demonstrate using Terraform with NDO. These are examplesonly and not meant to be used on production networks

Each Directory performs a NDO task. Hopefully, the names make sense

1-create_tenant
2-network_contract_policies
3-application_policies
4-add_sites_to_template
5-deploy_template
archive

Workflow:

1. modify replace_uid_pass_url.sh to match you ND instance and credentials, run the script
2. run ./flush_dot_terraform.sh to remove existing .terraform directories (maybe run once)
3. run ./init_dot_terraform.sh to "terraform init"  all of the directories
4. run either ./prompt_create.sh to walk through each directory, or no_prompt_create.sh
5. run ./destroy_terraform.sh to remove the NDO configuration, this will also run reset.sh

If the scripts fail, you will need to manually remove any NDO configuations. Tenant and schema objects will start with your UID. Then run ./reset.sh to clear out tfstate files

Several scripts to use

delete_dot_terraform.sh
   If you want to delete the .terrform diectory in each subdirectory. You may want to update the NDO provider version.

destroy_terraform_ndo_deploy.sh
   This will remove the NDO confiugration. It runs destory in each directory, But, starts with 6-deploy_template. I also did not destroy all of the children directories to speed things up. This also removes the terraform.tfstate and backup files

init_dot_terraform.sh
   This will run terraform init in each directory. In case they don't already exist from scriptdelete_dot_terraform

no_prompt_apply.sh
   This will deploy all of the directories with no prompt required

prompt_apply.sh
   This will walk through each directory and display main.tf and then apply. DO NOT ctrl-C out of this script. If you do, manually clean up NDO and run destroy-terraform-ndo_deploy.sh
replace_uid_pass_url.sh

replace_uid_pass_url.sh
  use this script, with some editing to change the UID/Password/URL for different users or NDO instances

damcfarl@cisco.com 19May2023
