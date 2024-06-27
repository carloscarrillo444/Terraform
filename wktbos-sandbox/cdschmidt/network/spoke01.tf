# VCN
resource "oci_core_vcn" "vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01" {
  cidr_block     = var.spoke01_vcn_cidr_block
  dns_label      = var.spoke01_vcn_dns_label
  compartment_id = var.compartment_ocid
  display_name   = var.spoke01_vcn_display_name
}

# Default route table spoke01
resource "oci_core_default_route_table" "rt-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-default" {
    manage_default_resource_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01.default_route_table_id
    display_name = "rt-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-default"
}
# Default security list
resource oci_core_default_security_list sl-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-default {
    manage_default_resource_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01.default_security_list_id
    display_name = "sl-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-default"

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
# Gateways
## NAT Gateway
resource "oci_core_nat_gateway" "ngw-mel-siceanz-tolling-sandbox-cdschmidt-spoke01" {
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01.id
    display_name = "ngw-mel-siceanz-tolling-sandbox-cdschmidt-spoke01"
    block_traffic = "false"
}
# Spoke01 subnets
## Spoke01-dns
resource "oci_core_subnet" "sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-dns-priv" {
    cidr_block = var.spoke01_dns_priv_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01.id
    display_name = var.spoke01_dns_priv_display_name
    prohibit_public_ip_on_vnic = true
    prohibit_internet_ingress  = true
    route_table_id = oci_core_route_table.rt-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-dns-priv.id

}
resource "oci_core_route_table" "rt-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-dns-priv" {
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01.id
    display_name = "rt-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-dns-priv"

    route_rules {
        network_entity_id = oci_core_drg.drg-mel-siceanz-tolling-sandbox-cdschmidt.id
        description       = "Access to spoke02 vcn"
        destination       = var.spoke02_vcn_cidr_block
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = oci_core_drg.drg-mel-siceanz-tolling-sandbox-cdschmidt.id
        description       = "Access to spoke03 vcn"
        destination       = var.spoke03_vcn_cidr_block
        destination_type  = "CIDR_BLOCK"
    }
}
## Spoke01-allaccess
resource "oci_core_subnet" "sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-allaccess-priv" {
    cidr_block = var.spoke01_allaccess_priv_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01.id
    display_name = var.spoke01_allaccess_priv_display_name
    dns_label = var.spoke01_allaccess_priv_dns_label
    prohibit_public_ip_on_vnic = true
    prohibit_internet_ingress  = true
    route_table_id = oci_core_route_table.rt-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-allaccess-priv.id
}
resource "oci_core_route_table" "rt-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-allaccess-priv" {
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01.id
    display_name = "rt-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-allaccess-priv"

    route_rules {
        network_entity_id = oci_core_drg.drg-mel-siceanz-tolling-sandbox-cdschmidt.id
        description       = "Access to spoke02 vcn"
        destination       = var.spoke02_vcn_cidr_block
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = oci_core_drg.drg-mel-siceanz-tolling-sandbox-cdschmidt.id
        description       = "Access to spoke03 vcn"
        destination       = var.spoke03_vcn_cidr_block
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = oci_core_nat_gateway.ngw-mel-siceanz-tolling-sandbox-cdschmidt-spoke01.id
        description       = "Route to internet"
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
    }
}
## Spoke01-spoke02access
resource "oci_core_subnet" "sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-spoke02access-priv" {
    cidr_block = var.spoke01_spoke02access_priv_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01.id
    display_name = var.spoke01_spoke02access_priv_display_name
    dns_label = var.spoke01_spoke02access_priv_dns_label
    prohibit_public_ip_on_vnic = true
    prohibit_internet_ingress  = true
    route_table_id = oci_core_route_table.rt-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-spoke02access-priv.id

}
resource "oci_core_route_table" "rt-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-spoke02access-priv" {
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01.id
    display_name = "rt-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-spoke02access-priv"

    route_rules {
        network_entity_id = oci_core_drg.drg-mel-siceanz-tolling-sandbox-cdschmidt.id
        description       = "Access to spoke02 vcn"
        destination       = var.spoke02_vcn_cidr_block
        destination_type  = "CIDR_BLOCK"
    }
}
## Spoke01-spoke03access
resource "oci_core_subnet" "sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-spoke03access-priv" {
    cidr_block = var.spoke01_spoke03access_priv_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01.id
    display_name = var.spoke01_spoke03access_priv_display_name
    dns_label = var.spoke01_spoke03access_priv_dns_label
    prohibit_public_ip_on_vnic = true
    prohibit_internet_ingress  = true
    route_table_id = oci_core_route_table.rt-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-spoke03access-priv.id
}
resource "oci_core_route_table" "rt-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-spoke03access-priv" {
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01.id
    display_name = "rt-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-spoke03access-priv"

    route_rules {
        network_entity_id = oci_core_drg.drg-mel-siceanz-tolling-sandbox-cdschmidt.id
        description       = "Access to spoke03 vcn"
        destination       = var.spoke03_vcn_cidr_block
        destination_type  = "CIDR_BLOCK"
    }
}
# DNS
## Resolver
resource "oci_dns_resolver" "dnsr-mel-siceanz-tolling-sandbox-cdschmidt-spoke01" {
    resolver_id = data.oci_core_vcn_dns_resolver_association.vcn-mel-siceanz-tolling-cdschmidt-spoke01-resolverassociation.dns_resolver_id
    display_name = "dnsr-mel-siceanz-tolling-sandbox-cdschmidt-spoke01"
    scope = "PRIVATE"
    attached_views {
        view_id = oci_dns_view.dnspv-mel-siceanz-tolling-sandbox-cdschmidt-spoke01.id
    }
    rules {
        action = "forward"
        destination_addresses = [var.spoke02_dns_listener_ip]
        source_endpoint_name = "dnsre_mel_siceanz_tolling_sandbox_cdschmidt_spoke01_forwarder"
        qname_cover_conditions = ["spoke02vcn.oraclevcn.com","spoke02.cdschmidt.nzaukwktbos.sice.com.au"]
    }
    rules {
        action = "forward"
        destination_addresses = [var.spoke03_dns_listener_ip]
        source_endpoint_name = "dnsre_mel_siceanz_tolling_sandbox_cdschmidt_spoke01_forwarder"
        qname_cover_conditions = ["spoke03vcn.oraclevcn.com","spoke03.cdschmidt.nzaukwktbos.sice.com.au"]
    }
}
## Resolver Endpoints
### Listener
resource "oci_dns_resolver_endpoint" "dnsre-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-listener" {
    is_forwarding = false
    is_listening = true
    name = "dnsre_mel_siceanz_tolling_sandbox_cdschmidt_spoke01_listener"
    resolver_id = data.oci_core_vcn_dns_resolver_association.vcn-mel-siceanz-tolling-cdschmidt-spoke01-resolverassociation.dns_resolver_id
    subnet_id = oci_core_subnet.sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-dns-priv.id
    scope = "PRIVATE"
    listening_address = var.spoke01_dns_listener_ip
}
### Forwarder
resource "oci_dns_resolver_endpoint" "dnsre-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-forwarder" {
    is_forwarding = true
    is_listening = false
    name = "dnsre_mel_siceanz_tolling_sandbox_cdschmidt_spoke01_forwarder"
    resolver_id = data.oci_core_vcn_dns_resolver_association.vcn-mel-siceanz-tolling-cdschmidt-spoke01-resolverassociation.dns_resolver_id
    subnet_id = oci_core_subnet.sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-dns-priv.id
    scope = "PRIVATE"
    forwarding_address = var.spoke01_dns_forwarder_ip
}
### Private View
resource "oci_dns_view" "dnspv-mel-siceanz-tolling-sandbox-cdschmidt-spoke01" {
    compartment_id = var.compartment_ocid
    display_name = "dnspv-mel-siceanz-tolling-sandbox-cdschmidt-spoke01"
    scope = "PRIVATE"
}
### Zone
resource "oci_dns_zone" "dnsz-au-com-sice-nzaukwktbos-cdschmidt-spoke01" {
    compartment_id = var.compartment_ocid
    name = "spoke01.cdschmidt.nzaukwktbos.sice.com.au"
    zone_type = "PRIMARY"
    scope = "PRIVATE"
    view_id = oci_dns_view.dnspv-mel-siceanz-tolling-sandbox-cdschmidt-spoke01.id
}
### Records
#### spoke01.cdschmidt.nzaukwktbos.sice.com.au
resource oci_dns_rrset dnsrrset-au-com-sice-nzaukwktbos-cdschmidt-spoke01-test_A {
  compartment_id = var.compartment_ocid
  domain = "test.spoke01.cdschmidt.nzaukwktbos.sice.com.au"
  items {
    domain = "test.spoke01.cdschmidt.nzaukwktbos.sice.com.au"
    rdata  = "1.2.3.4"
    rtype  = "A"
    ttl    = "3600"
  }
  rtype = "A"
  scope = "PRIVATE"
  zone_name_or_id = oci_dns_zone.dnsz-au-com-sice-nzaukwktbos-cdschmidt-spoke01.id
}