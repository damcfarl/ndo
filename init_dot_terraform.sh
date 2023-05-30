#/bin/bash

## run terraform init in each directory
## remove any old terraform json files

for dir in [1-5]*

do
  echo $dir
  cd $dir
  pwd
  rm -rf ./terrform*
  rm terraform.*
  terraform init
  cd ../
done
