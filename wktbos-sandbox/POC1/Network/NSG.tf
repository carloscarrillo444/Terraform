provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

# Define variables for OCI credentials and configuration
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

# Variable for compartment OCID and VCN OCID
variable "compartment_ocid" {}
variable "vcn_ocid" {}

# Resource to create a Network Security Group (NSG)
resource "oci_core_network_security_group" "wktbos_nsg" {
  compartment_id = var.compartment_ocid
  vcn_id         = var.vcn_ocid
  display_name   = "wktbos_nsg"
}

# Resource to create Network Security Group Security Rules
resource "oci_core_network_security_group_security_rule" "wktbos_rule" {
  network_security_group_id = oci_core_network_security_group.wktbos_nsg.id

  # Ingress Rule
  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"

    tcp_options {
      destination_port_range {
        min = 22
        max = 22
      }
    }
  }

  # Egress Rule
  egress_security_rules {
    protocol = "all"
    destination = "0.0.0.0/0"
  }
}

output "network_security_group_id" {
  value = oci_core_network_security_group.wktbos_nsg.id
}
