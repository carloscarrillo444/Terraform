#Hub VCN
resource "oci_core_vcn" "vcn-mel-siceanz-tolling-sandbox-cdschmidt-hub" {
  cidr_block     = var.hub_vcn_cidr_block
  dns_label      = var.hub_vcn_dns_label
  compartment_id = var.compartment_ocid
  display_name   = var.hub_vcn_display_name
}

#Default route table hub
resource "oci_core_default_route_table" "rt-mel-siceanz-tolling-sandbox-cdschmidt-hub-default" {
    manage_default_resource_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-hub.default_route_table_id
    display_name = "rt-mel-siceanz-tolling-sandbox-cdschmidt-hub-default"
}
# Default security list
resource oci_core_default_security_list sl-mel-siceanz-tolling-sandbox-cdschmidt-hub-default {
    manage_default_resource_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-hub.default_security_list_id
    display_name = "sl-mel-siceanz-tolling-sandbox-cdschmidt-hub-default"

    egress_security_rules {
        description = "Allow all outbound"
        protocol = "all"
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
        stateless = "false"
    }
    ingress_security_rules {
        description = "Allow all inbound"
        protocol = "all"
        source = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"
        stateless = "false"
  } 
}
#hub dns subnet
resource "oci_core_subnet" "sn-mel-siceanz-tolling-sandbox-hub-dns-priv" {
    cidr_block = var.hub_dns_priv_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-hub.id
    display_name = var.hub_dns_priv_display_name
    prohibit_public_ip_on_vnic = true
    prohibit_internet_ingress  = true
}
#hub dmz subnet
resource "oci_core_subnet" "sn-mel-siceanz-tolling-sandbox-hub-dmz-priv" {
    cidr_block = var.hub_dmz_priv_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-hub.id
    display_name = var.hub_dmz_priv_display_name
    prohibit_public_ip_on_vnic = true
    prohibit_internet_ingress  = true
}