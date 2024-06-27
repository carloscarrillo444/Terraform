provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

variable "compartment_ocid" {
  description = "The OCID of the compartment where the security list will be created"
}

variable "vcn_ocid" {
  description = "The OCID of the VCN where the security list will be associated"
}

resource "oci_core_security_list" "wktbos_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = var.vcn_ocid
  display_name   = "wktbos_security_list"

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6"

    tcp_options {
      max = 65535
      min = 1
    }

    description = "Allow all outbound traffic"
  }

  ingress_security_rules {
    source      = "0.0.0.0/0"
    protocol    = "6"

    tcp_options {
      max = 22
      min = 22
    }

    description = "Allow SSH access from anywhere"
  }

  ingress_security_rules {
    source      = "0.0.0.0/0"
    protocol    = "1"

    icmp_options {
      code = 4
      type = 3
    }

    description = "Allow ICMP type 3 code 4"
  }
}
