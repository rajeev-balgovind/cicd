


resource "openstack_compute_instance_v2" "web-01" {
        name = "web-01"
        image_name = "Ubuntu 16.04"
        availability_zone = "private"
        flavor_name = "m1.large"
        key_pair = "${var.openstack_keypair}"
        security_groups = ["default"]
        network {
                name = "${openstack_networking_network_v2.test_target_network.name}"
        }
  user_data = "${file("bootstrapweb.sh")}"
}

resource "openstack_compute_instance_v2" "web-02" {
        name = "web-02"
        image_name = "Ubuntu 16.04"
        availability_zone = "private"
        flavor_name = "m1.large"
        key_pair = "${var.openstack_keypair}"
        security_groups = ["default"]
        network {
                name = "${openstack_networking_network_v2.test_target_network.name}"
        }
  user_data = "${file("bootstrapweb.sh")}"
}

resource "openstack_networking_floatingip_v2" "haproxy-01-fip" {
	pool = "public_network"
	}


resource "openstack_compute_instance_v2" "haproxy-01" {
        name = "haproxy-01-test"
        image_name = "Ubuntu 16.04"
        flavor_name = "small desktop for windows"
        key_pair = "${var.openstack_keypair}"
        security_groups = ["default"]
        network {
                name = "${openstack_networking_network_v2.test_target_network.name}"
        }
  user_data = "${file("bootstraphaproxy.sh")}"
}

resource "openstack_compute_floatingip_associate_v2" "assoc-haproxy-01-fip" {
  floating_ip = "${openstack_networking_floatingip_v2.haproxy-01-fip.address}"
  instance_id = "${openstack_compute_instance_v2.haproxy-01.id}"
}


output "web1_address" {
	value = "${openstack_compute_instance_v2.web-01.access_ip_v4}" }

output "web2_address" {
        value = "${openstack_compute_instance_v2.web-02.access_ip_v4}" }
output "haproxy_fip" {
	value = "${openstack_compute_floatingip_associate_v2.assoc-haproxy-01-fip.floating_ip}" }

