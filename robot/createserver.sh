#!/bin/bash

COMPONENT=$1

AMI_ID="$(aws ec2 describe-images --region us-east-1 --filters "Name=name,Values=DevOps-LabImage-CentOS7" | jq '.Images[].ImageId' | sed -e 's/"//g')"
SG_ID="$(aws ec2 describe-security-groups --filters Name=group-name,Values=b51-allow-all | jd '.SecurityGroups[].GroupId' | sed -e 's/"//g')"

echo "AMI ID used to launch the instance is :$AMI_ID"
echo "SG ID used to launch the instance is :$SG_ID"

aws ec2 run-instances --image-id $AMI_ID --instance-type t2.micro --security-group-ids $SG_ID --tag-specifications "ResourceType=instance,Tags=[{Key=name,Value=&COMPONENT}]" | jq