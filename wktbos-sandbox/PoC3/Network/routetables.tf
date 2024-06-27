# Default Route table
resource "oci_core_default_route_table" "rt-mel-siceanz-tolling-poc3" {
  display_name = "Default rt-mel-siceanz-tolling-poc3"
  manage_default_resource_id = oci_core_vcn.vcn-mel-siceanz-tolling-poc3.default_route_table_id
    route_rules {
        network_entity_id = var.drg_ocid
        description       = "Route to SICEANZ mgmt environment"
        destination       = var.vcn_mgmt_cidr_block
        destination_type  = "CIDR_BLOCK"  
    }
    route_rules {
        network_entity_id = var.drg_ocid
        description       = "Route to SICEANZ poc1 subnets"
        destination       = var.vcn_cidr_block
        destination_type  = "CIDR_BLOCK"  
    }
    route_rules {
        network_entity_id = var.drg_ocid
        description       = "Route to internet through SS NAT gateway via DRG"
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = var.drg_ocid
        description       = "Route for all OCI servies through SS Service gateway via DRG"
        destination       = "all-mel-services-in-oracle-services-network"
        destination_type  = "SERVICE_CIDR_BLOCK"
    }   
}
# Subnet route tables
## DMZ
resource "oci_core_route_table" "rt-mel-siceanz-tolling-poc3-dmz-priv" {
    compartment_id = var.cmp_network
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-poc3.id
    display_name = "rt-mel-siceanz-tolling-poc3-dmz-priv"

    route_rules {
        network_entity_id = var.drg_ocid
        description       = "Route to SICEANZ mgmt environment"
        destination       = var.vcn_mgmt_cidr_block
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = var.drg_ocid
        description       = "Route to internet through SS NAT gateway via DRG"
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = var.drg_ocid
        description       = "Route for all OCI servies through SS Service gateway via DRG"
        destination       = "all-mel-services-in-oracle-services-network"
        destination_type  = "SERVICE_CIDR_BLOCK"
    } 
}
## External Interface
resource "oci_core_route_table" "rt-mel-siceanz-tolling-poc3-externalinterface-priv" {
    compartment_id = var.cmp_network
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-poc3.id
    display_name = "rt-mel-siceanz-tolling-poc3-dmz-priv"

    route_rules {
        network_entity_id = var.drg_ocid
        description       = "Route to SICEANZ mgmt environment"
        destination       = var.vcn_mgmt_cidr_block
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = var.drg_ocid
        description       = "Route to PoC3 commercial portal subnet"
        destination       = var.commercialportal_subnet_cidr
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = var.drg_ocid
        description       = "Route to PoC3 operational portal subnet"
        destination       = var.operationalportal_subnet_cidr
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = var.drg_ocid
        description       = "Route to PoC3 commercial app subnet"
        destination       = var.commercialapp_subnet_cidr
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = var.drg_ocid
        description       = "Route to PoC3 operational app subnet"
        destination       = var.opertionalapp_subnet_cidr
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = var.drg_ocid
        description       = "Route to PoC3 database portal subnet"
        destination       = var.database_subnet_cidr
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = var.drg_ocid
        description       = "Route to internet through SS NAT gateway via DRG"
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = var.drg_ocid
        description       = "Route for all OCI servies through SS Service gateway via DRG"
        destination       = "all-mel-services-in-oracle-services-network"
        destination_type  = "SERVICE_CIDR_BLOCK"
    } 
}