#!/bin/bash
sleep  30
terraform output -json > $1
