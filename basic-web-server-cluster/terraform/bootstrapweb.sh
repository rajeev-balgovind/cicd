#!/bin/bash
apt-get -y update
apt-get -y upgrade
apt-get -y install apache2
service apache2 restart

