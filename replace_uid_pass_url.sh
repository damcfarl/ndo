#!/bin/sh

#####################
#
# Modify the NEW_VALUES to match your NDO and UID
# it will modify a skeleton file and copy it to variables.tf
# in each directory
# NDO objects will be created starting with your UID
# this should make them easy to find
#
#####################

#####################
#
# Make changes here
NEW_UID=user_name
NEW_SITE1=site1
NEW_SITE2=site2
NEW_NDO_IP="10.10.10.10"
NEW_PASS="password"
#
#
####################

#####################
#
# Don't change anything in between the comments
OLD_UID=ND_USER
OLD_SITE1=ND_SITE1
OLD_SITE2=ND_SITE2
OLD_NDO_IP="ZZ.ZZ.ZZ.ZZ"
OLD_PASS="ND_PASS"
OLD_FILE="variables.tf"
TMP_FILE="ZZ_FILE.tf"
#
#####################

for directory in [1-5]* 

do
   cd $directory
    cat variables.SKEL | sed s/$OLD_UID/$NEW_UID/ | sed s/$OLD_SITE1/$NEW_SITE1/ | sed s/$OLD_SITE2/$NEW_SITE2/ | sed s/$OLD_NDO_IP/$NEW_NDO_IP/ | sed s/$OLD_PASS/$NEW_PASS/ | tee $TMP_FILE
    mv $TMP_FILE variables.tf
   cd ../
done

##  cat variables.tf | sed s/$OLD_UID/$NEW_UID/ | tee $TMP_FILE
