#Create standard VCN for 
resource "oci_core_vcn" "vcn-mel-siceanz-tolling-poc3" {
    cidr_block     = var.vcn_cidr_block
    compartment_id = var.cmp_network 
    display_name   = var.vcn_display_name
    dns_label      = var.vcn_dns_label
    is_ipv6enabled = "false"
}

#Create below subnets for above VCN
resource "oci_core_subnet" "sn-mel-siceanz-tolling-poc3-dmz-priv" {
    cidr_block          = var.dmz_subnet_cidr
    compartment_id      = var.cmp_network  
    display_name        = var.dmz_display_name
    vcn_id              = oci_core_vcn.vcn-mel-siceanz-tolling-poc3.id
    route_table_id      = oci_core_route_table.rt-mel-siceanz-tolling-poc3-dmz-priv.id
    prohibit_internet_ingress  = "true"
    prohibit_public_ip_on_vnic = "true"
}
resource "oci_core_subnet" "sn-mel-siceanz-tolling-poc3-commercialportal-priv" {
    cidr_block          = var.commercialportal_subnet_cidr
    compartment_id      = var.cmp_network  
    display_name        = var.commercialportal_display_name
    vcn_id              = oci_core_vcn.vcn-mel-siceanz-tolling-poc3.id
    prohibit_internet_ingress  = "true"
    prohibit_public_ip_on_vnic = "true"
}
resource "oci_core_subnet" "sn-mel-siceanz-tolling-poc3-operationalportal-priv" {
    cidr_block          = var.operationalportal_subnet_cidr
    compartment_id      = var.cmp_network  
    display_name        = var.operationalportal_display_name
    vcn_id              = oci_core_vcn.vcn-mel-siceanz-tolling-poc3.id
    prohibit_internet_ingress  = "true"
    prohibit_public_ip_on_vnic = "true"
}
resource "oci_core_subnet" "sn-mel-siceanz-tolling-poc3-externalinterface-priv" {
    cidr_block          = var.externalinterface_subnet_cidr
    compartment_id      = var.cmp_network  
    display_name        = var.externalinterface_display_name
    vcn_id              = oci_core_vcn.vcn-mel-siceanz-tolling-poc3.id
    route_table_id      = oci_core_route_table.rt-mel-siceanz-tolling-poc3-externalinterface-priv.id
    prohibit_internet_ingress  = "true"
    prohibit_public_ip_on_vnic = "true"
}
resource "oci_core_subnet" "sn-mel-siceanz-tolling-poc3-commercialapp-priv" {
    cidr_block          = var.commercialapp_subnet_cidr
    compartment_id      = var.cmp_network
    display_name        = var.commercialapp_display_name
    vcn_id              = oci_core_vcn.vcn-mel-siceanz-tolling-poc3.id
    prohibit_internet_ingress  = "true"
    prohibit_public_ip_on_vnic = "true"
}
resource "oci_core_subnet" "sn-mel-siceanz-tolling-poc3-operationalapp-priv" {
    cidr_block          = var.opertionalapp_subnet_cidr
    compartment_id      = var.cmp_network  
    display_name        = var.opertionalapp_display_name
    vcn_id              = oci_core_vcn.vcn-mel-siceanz-tolling-poc3.id
    prohibit_internet_ingress  = "true"
    prohibit_public_ip_on_vnic = "true"
}
  resource "oci_core_subnet" "sn-mel-siceanz-tolling-poc3-database-priv" {
    cidr_block          = var.database_subnet_cidr
    compartment_id      = var.cmp_network  
    display_name        = var.database_display_name
    vcn_id              = oci_core_vcn.vcn-mel-siceanz-tolling-poc3.id
    prohibit_internet_ingress  = "true"
    prohibit_public_ip_on_vnic = "true"
}