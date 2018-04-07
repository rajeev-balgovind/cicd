#!/bin/bash
terraform init
terraform apply -auto-approve
sleep 30
terraform output -json > ansible.var
