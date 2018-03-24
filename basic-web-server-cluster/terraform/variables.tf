variable "openstack_user_name" {
	description = "Openstack Tenant Username"
	default = "devopsuser!@#$"  }

variable "openstack_tenant_name" {
	description = "Name of the tenant"
	default = "DevOps" }

variable "openstack_password" {
	description = "The password"
	default = "D3v0ps_gurr1" }

variable "openstack_auth_url" {
	description = "Authentication URL"
	default = "https://cloud.sapiennetworks.com:5000/v2.0" }

variable "openstack_keypair" {
	description = "The keypair to be used."
	default  = "gsb-rbg-openstack-standard" }

variable "count" {
	description = "Number of servers needed"
	default = "2" }




	


