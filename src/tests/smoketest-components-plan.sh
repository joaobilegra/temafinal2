#!/bin/bash

environment=$1
region=$2
bucket=$3

if [[ ${environment} == 'dev' || ${environment} == 'shared' || ${environment} == 'local' || ${environment} == 'prod' ]]; then

	tfvarfile="variables-${environment}.tfvars"

else 

	echo "Environment not configured. Exiting..."
	exit 127

fi

cd ../resources

terraform init -var-file="environment-vars/${tfvarfile}" -var-file="environment-vars/secrets.tfvars" \
--backend-config="bucket=${bucket}" \
--backend-config="key=${environment}/infrastructure-state" \
--backend-config="region=${region}"

plan=`terraform plan -var-file="environment-vars/${tfvarfile}" -var-file="environment-vars/secrets.tfvars"`

echo $plan

if [[ $plan =~ "No changes. Infrastructure is up-to-date" ]]
then
   echo "No changes ... keep going"
   exit 0
else 
   echo "Environment changed - check changes and apply plan"
   exit 127   
fi
