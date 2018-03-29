#!/bin/bash
haproxy_floating_ip=$(terraform output haproxy_fip)
web_1_address=$(terraform output web1_address)
web_2_address=$(terraform output web2_address)

echo Loadbalancer on $haproxy_floating_ip will forward to $web_1_address and $web_2_address on port 80
