#/bin/bash

AWS_ACCESS_KEY_ID=$1
AWS_SECRET_ACCESS_KEY=$2

if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ];
then
    echo "Please set pass args."
    exit 1
fi

mkdir -p $HOME/.aws

printf "[default]
region = eu-central-1" > /root/.aws/config


printf "[default]
aws_access_key_id = $AWS_ACCESS_KEY_ID
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY" > /root/.aws/credentials

aws sts get-caller-identity
