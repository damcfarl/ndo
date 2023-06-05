#!/bin/bash


echo ##############################################################
echo #                                                            #
echo -ne "View create tenant main.tf, would you like to continue? "
echo #                                                            #
echo ##############################################################
read -p "Y|N: "
if [[ $REPLY =~ ^[Yy]$ ]]
   then
   cd 1-create_tenant
   pwd
   cat main.tf
   echo #######################################################
   echo #                                                     #
   echo -ne "Apply create tenant, would you like to continue? "
   echo #                                                     #
   echo #######################################################
   read -p "Y|N: "
   if [[ $REPLY =~ ^[Yy]$ ]]
   then
      echo "Current Directory: " 
      pwd
      terraform apply -auto-approve -parallelism=1
      cd ../
      sleep 2
   fi
fi

echo ###############################################################
echo #                                                             #
echo -ne "View create schema, vrf, bd, would you like to continue? "
echo #                                                             #
echo ###############################################################
read -p "Y|N: "
if [[ $REPLY =~ ^[Yy]$ ]]
   then
   cd 2-Network-Contract_polices
   pwd
   cat main.tf
   echo ###############################################################
   echo #                                                             #
   echo -ne "View create schema, vrf, bd, would you like to continue? "
   echo #                                                             #
   echo ###############################################################
   read -p "Y|N: "
   if [[ $REPLY =~ ^[Yy]$ ]]
   then
      echo "Current Directory: " 
      pwd
      terraform apply -auto-approve 
      cd ../
      sleep 2
   fi
fi

echo #########################################################################
echo #                                                                       #
echo -ne "View create application policies main.tf, would you like to continue? "
echo #                                                                       #
echo #########################################################################
read -p "Y|N: "
if [[ $REPLY =~ ^[Yy]$ ]]
   then
   cd 3-application_policies
   pwd
   cat main.tf
   echo ##################################################################
   echo #                                                                #
   echo -ne "Apply create application policies, would you like to continue? "
   echo #                                                                #
   echo ##################################################################
   read -p "Y|N: "
   if [[ $REPLY =~ ^[Yy]$ ]]
   then
      echo "Current Directory: " 
      pwd
      terraform apply -auto-approve -parallelism=1
      cd ../
      sleep 2
   fi
fi

echo ############################################################################
echo #                                                                          #
echo -ne "View add sites to template main.tf, would you like to continue? "
echo #                                                                          #
echo ############################################################################
read -p "Y|N: "
if [[ $REPLY =~ ^[Yy]$ ]]
   then
   cd 4-add_sites_to_template
   pwd
   cat main.tf
   echo #####################################################################
   echo #                                                                   #
   echo -ne "Apply add sites to template, would you like to continue? "
   echo #                                                                   #
   echo #####################################################################
   read -p "Y|N: "
   if [[ $REPLY =~ ^[Yy]$ ]]
   then
      echo "Current Directory: " 
      pwd
      terraform apply -auto-approve 
      cd ../
      sleep 2
   fi
fi

echo ######################################################################
echo #                                                                    #
echo -ne "Deploy to sites? "
echo #                                                                    #
echo ######################################################################
read -p "Y|N: "
if [[ $REPLY =~ ^[Yy]$ ]]
   then
   cd 5-deploy_template
   pwd
   cat main.tf
   echo ###############################################################
   echo #                                                             #
   echo -ne "Deploy to sites"
   echo #                                                             #
   echo ###############################################################
   read -p "Y|N: "
   if [[ $REPLY =~ ^[Yy]$ ]]
   then
      echo "Current Directory: " 
      pwd
      terraform apply -auto-approve -parallelism=1
      cd ../
      sleep 2
   fi
fi







