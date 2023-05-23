#/bin/bash

## Run this after you destroy the config
## Otherwise, you'll see apply errors

for file in `find . | grep terraform.tf*`
do
  ls $file
  rm $file
done
