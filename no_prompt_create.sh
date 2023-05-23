#!/bin/bash


echo ##############################################################
echo #                                                            #
echo -ne "View create tenant main.tf, would you like to continue? "
echo #                                                            #
echo ##############################################################
   cd 1-create_tenant
   pwd
      echo "Current Directory: " 
      pwd
      rm terraform.tfstate*
      terraform apply -auto-approve 
      cd ../
      sleep 2

echo ########################################################################
echo #                                                                      #
echo -ne "View create network and contract policies main.tf, would you like to continue? "
echo #                                                                      #
echo ########################################################################
   cd 2-Network-Contract_polices
   pwd
   cat main.tf
      echo "Current Directory: " 
      pwd
      terraform apply -auto-approve 
      cd ../
      sleep 2
echo #########################################################################
echo #                                                                       #
echo -ne "View application policies main.tf, would you like to continue? "
echo #                                                                       #
echo #########################################################################
   cd 3-application_policies
   pwd
   cat main.tf
      echo "Current Directory: " 
      pwd
      terraform apply -auto-approve 
      cd ../
      sleep 2

echo ############################################################################
echo #                                                                          #
echo -ne "View add_sites_to_template main.tf, would you like to continue? "
echo #                                                                          #
echo ############################################################################
   cd 4-add_sites_to_template
   pwd
   cat main.tf
      echo "Current Directory: " 
      pwd
      terraform apply -auto-approve 
      cd ../
      sleep 2
   cd 5-deploy_template
   pwd
   cat main.tf
      echo "Current Directory: " 
      pwd
      terraform apply -auto-approve 
      cd ../
      sleep 2

<< "MULTILINE-COMMENT"

MULTILINE-COMMENT
