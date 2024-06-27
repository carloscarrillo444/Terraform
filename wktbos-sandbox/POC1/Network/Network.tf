#Create standard VCN for 
resource "oci_core_vcn" "vcn-mel-siceanz-tolling-poc1" {
  cidr_block     = var.vcn_cidr_block
  compartment_id = var.compartment_ocid
  display_name   = var.vcn_display_name
  dns_label      = var.vcn_dns_label
  is_ipv6enabled = "false"
}
# DRG Attachment to drg-mel-siceanz-tolling-ss 
resource "oci_core_drg_attachment" "drga-mel-siceanz-tolling-poc1" {
    drg_id = var.drg_ocid
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-poc1.id
    display_name = var.poc1_drg_attachment_display_name
}
# Route Distribution Statement
resource "oci_core_drg_route_distribution_statement" "drgrds-mel-siceanz-tolling-poc1" {
    drg_route_distribution_id = var.drgrd_ss_import
    action = "ACCEPT"
    match_criteria {
        match_type = "DRG_ATTACHMENT_ID"
        attachment_type = "VCN"
        drg_attachment_id = oci_core_drg_attachment.drga-mel-siceanz-tolling-poc1.id
    }
    priority = "2"
}
#Create below subnets for above VCN
resource "oci_core_subnet" "sn-mel-siceanz-tolling-poc1-commercialportal-priv" {
  cidr_block     = var.commercialportal_subnet_cidr
  compartment_id = var.compartment_ocid
  display_name   = var.commercialportal_display_name
  vcn_id         = oci_core_vcn.vcn-mel-siceanz-tolling-poc1.id
  prohibit_internet_ingress  = "true"
	prohibit_public_ip_on_vnic = "true"
}

resource "oci_core_subnet" "sn-mel-siceanz-tolling-poc1-operationalportal-priv" {
  cidr_block      = var.operationalportal_subnet_cidr
  compartment_id  = var.compartment_ocid
  display_name    = var.operationalportal_display_name
  vcn_id          = oci_core_vcn.vcn-mel-siceanz-tolling-poc1.id
  prohibit_internet_ingress  = "true"
	prohibit_public_ip_on_vnic = "true"
}

resource "oci_core_subnet" "sn-mel-siceanz-tolling-poc1-externalinterface-priv" {
  cidr_block       = var.externalinterface_subnet_cidr
  compartment_id   = var.compartment_ocid
  display_name     = var.externalinterface_display_name
  vcn_id           = oci_core_vcn.vcn-mel-siceanz-tolling-poc1.id
  prohibit_internet_ingress  = "true"
	prohibit_public_ip_on_vnic = "true"
}

resource "oci_core_subnet" "sn-mel-siceanz-tolling-poc1-commercialapp-priv" {
  cidr_block        = var.commercialapp_subnet_cidr
  compartment_id    = var.compartment_ocid
  display_name      = var.commercialapp_display_name
  vcn_id            = oci_core_vcn.vcn-mel-siceanz-tolling-poc1.id
  prohibit_internet_ingress  = "true"
	prohibit_public_ip_on_vnic = "true"
}

resource "oci_core_subnet" "sn-mel-siceanz-tolling-poc1-operationalapp-priv" {
  cidr_block         = var.opertionalapp_subnet_cidr
  compartment_id     = var.compartment_ocid
  display_name       = var.opertionalapp_display_name
  vcn_id              = oci_core_vcn.vcn-mel-siceanz-tolling-poc1.id
  prohibit_internet_ingress  = "true"
	prohibit_public_ip_on_vnic = "true"
}
  resource "oci_core_subnet" "sn-mel-siceanz-tolling-poc1-database-priv" {
  cidr_block          = var.database_subnet_cidr
  compartment_id      = var.compartment_ocid
  display_name        = var.database_display_name
  vcn_id              = oci_core_vcn.vcn-mel-siceanz-tolling-poc1.id
  prohibit_internet_ingress  = "true"
	prohibit_public_ip_on_vnic = "true"
}

# Default Route table - note to create variables for values below - awaiting shared-service access
resource "oci_core_default_route_table" "rt-mel-siceanz-tolling-poc1" {
  display_name = "Default rt-mel-siceanz-tolling-poc1"
  manage_default_resource_id = oci_core_vcn.vcn-mel-siceanz-tolling-poc1.default_route_table_id
    route_rules {
        network_entity_id = var.drg_ocid
        description       = var.routing_mgmt_description
        destination       = var.routing_mgmt_cidr
        destination_type  = "CIDR_BLOCK"  
    }
    route_rules {
        network_entity_id = var.drg_ocid
        description       = var.routing_ss_description
        destination       = var.routing_ss_cidr
        destination_type  = "CIDR_BLOCK"  
    }
}

#Security List
resource oci_core_default_security_list sl-mel-siceanz-tolling-poc1 {
    manage_default_resource_id = oci_core_vcn.vcn-mel-siceanz-tolling-poc1.default_security_list_id
    display_name = "Default sl-mel-siceanz-tolling-poc2"

    egress_security_rules {
        description = "Allow all outbound"
        destination      = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
        protocol  = "all"
        stateless = "false"
    }
    ingress_security_rules {
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
  } 
}
