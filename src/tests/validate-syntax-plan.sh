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

terraform validate -json -no-color
