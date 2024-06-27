#Security List
resource oci_core_default_security_list sl-mel-siceanz-tolling-poc3 {
    manage_default_resource_id = oci_core_vcn.vcn-mel-siceanz-tolling-poc3.default_security_list_id
    display_name = "Default sl-mel-siceanz-tolling-poc3"

    egress_security_rules {
        description = "Allow all outbound"
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
        protocol = "all"
        stateless = "false"
    }
    ingress_security_rules {
        description = "Allow all inbound"
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"
        protocol  = "all"
        stateless = "false"
    }
/*     ingress_security_rules {
        description = "Allow SSH inbound"
        protocol    = "6" #TCP
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"
        stateless   = "false"
        tcp_options {
            max = "22"
            min = "22"
        }
    }
    ingress_security_rules {
        description = "Allow inbound ICMP"
        protocol    = "1" #ICMP
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"
        stateless   = "false"
  }  */
}