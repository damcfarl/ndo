#/bin/bash

## rm .terraform and .terraform.lock.hcl files
## Otherwise, you'll see apply errors

for dir in [1-5]*

do
  echo $dir
  cd $dir
  pwd
  rm -rf .terraform*
  rm terraform*
  rm .terraform*
  cd ../
done
