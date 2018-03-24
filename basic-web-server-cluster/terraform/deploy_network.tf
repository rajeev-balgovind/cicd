resource "openstack_networking_network_v2" "test_target_network" {
	name = "test_target_1"
	admin_state_up = "true" }

resource "openstack_networking_subnet_v2" "subnet_1" {
	name = "test_subnet_1"
	network_id = "${openstack_networking_network_v2.test_target_network.id}"
	cidr = "10.200.200.0/24"
	ip_version = 4 }

resource "openstack_networking_router_v2" "router_1" {
  	name = "test_target_network_router"
        admin_state_up = true
	external_network_id = "4d43fe7b-664f-4fb0-874d-6d768c778c5d" }

resource "openstack_networking_router_interface_v2" "router1_interface_1" {
	router_id = "${openstack_networking_router_v2.router_1.id}"
  	subnet_id = "${openstack_networking_subnet_v2.subnet_1.id}" }

output "network_name" {
	value = "${openstack_networking_network_v2.test_target_network.name}"}









