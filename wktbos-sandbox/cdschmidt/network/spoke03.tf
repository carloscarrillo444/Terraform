resource "oci_core_vcn" "vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03" {
  cidr_block     = var.spoke03_vcn_cidr_block
  dns_label      = var.spoke03_vcn_dns_label
  compartment_id = var.compartment_ocid
  display_name   = var.spoke03_vcn_display_name
}

#Default route table spoke01
resource "oci_core_default_route_table" "rt-mel-siceanz-tolling-sandbox-cdschmidt-spoke03-default" {
    manage_default_resource_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03.default_route_table_id
    display_name = "rt-mel-siceanz-tolling-sandbox-cdschmidt-spoke03-default"
    
    route_rules {
        network_entity_id = oci_core_drg.drg-mel-siceanz-tolling-sandbox-cdschmidt.id
        description       = "Access to spoke01 (mgmt) vcn"
        destination       = var.spoke01_vcn_cidr_block
        destination_type  = "CIDR_BLOCK"
    }
}
#Default security list
resource oci_core_default_security_list sl-mel-siceanz-tolling-sandbox-cdschmidt-spoke03-default {
    manage_default_resource_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03.default_security_list_id
    display_name = "sl-mel-siceanz-tolling-sandbox-cdschmidt-spoke03-default"

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
#spoke03 subnets
## Spoke01-dns
resource "oci_core_subnet" "sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03-dns-priv" {
    cidr_block = var.spoke03_dns_priv_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03.id
    display_name = var.spoke03_dns_priv_display_name
    prohibit_public_ip_on_vnic = true
    prohibit_internet_ingress  = true
}
## spoke03-app
resource "oci_core_subnet" "sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03-app-priv" {
    cidr_block = var.spoke03_app_priv_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03.id
    display_name = var.spoke03_app_priv_display_name
    dns_label = var.spoke03_app_priv_dns_label
    prohibit_public_ip_on_vnic = true
    prohibit_internet_ingress  = true
}
## spoke03-db
resource "oci_core_subnet" "sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03-db-priv" {
    cidr_block = var.spoke03_db_priv_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03.id
    display_name = var.spoke03_db_priv_display_name
    dns_label = var.spoke03_db_priv_dns_label
    prohibit_public_ip_on_vnic = true
    prohibit_internet_ingress  = true
}
# DNS
## Resolver
resource "oci_dns_resolver" "dnsr-mel-siceanz-tolling-sandbox-cdschmidt-spoke03" {
    resolver_id = data.oci_core_vcn_dns_resolver_association.vcn-mel-siceanz-tolling-cdschmidt-spoke03-resolverassociation.dns_resolver_id
    display_name = "dnsr-mel-siceanz-tolling-sandbox-cdschmidt-spoke03"
    scope = "PRIVATE"
    attached_views {
        view_id = oci_dns_view.dnspv-mel-siceanz-tolling-sandbox-cdschmidt-spoke03.id
    }
}
## Resolver Endpoints
### Listener
resource "oci_dns_resolver_endpoint" "dnsre-mel-siceanz-tolling-sandbox-cdschmidt-spoke03-listener" {
    is_forwarding = false
    is_listening = true
    name = "dnsre_mel_siceanz_tolling_sandbox_cdschmidt_spoke03_listener"
    resolver_id = data.oci_core_vcn_dns_resolver_association.vcn-mel-siceanz-tolling-cdschmidt-spoke03-resolverassociation.dns_resolver_id
    subnet_id = oci_core_subnet.sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03-dns-priv.id
    scope = "PRIVATE"
    listening_address = var.spoke03_dns_listener_ip
}
### Private View
resource "oci_dns_view" "dnspv-mel-siceanz-tolling-sandbox-cdschmidt-spoke03" {
    compartment_id = var.compartment_ocid
    display_name = "dnspv-mel-siceanz-tolling-sandbox-cdschmidt-spoke03"
    scope = "PRIVATE"
}
### Zone
resource "oci_dns_zone" "dnsz-au-com-sice-nzaukwktbos-cdschmidt-spoke03" {
    compartment_id = var.compartment_ocid
    name = "spoke03.cdschmidt.nzaukwktbos.sice.com.au"
    zone_type = "PRIMARY"
    scope = "PRIVATE"
    view_id = oci_dns_view.dnspv-mel-siceanz-tolling-sandbox-cdschmidt-spoke03.id
}
### Records
#### spoke03.cdschmidt.nzaukwktbos.sice.com.au
/*
resource oci_dns_rrset dnsrrset-au-com-sice-nzaukwktbos-cdschmidt-spoke03-test_A {
  compartment_id = var.compartment_ocid
  domain = "test.spoke03.cdschmidt.nzaukwktbos.sice.com.au"
  items {
    domain = "test.spoke03.cdschmidt.nzaukwktbos.sice.com.au"
    rdata  = "9.10.11.12"
    rtype  = "A"
    ttl    = "3600"
  }
  rtype = "A"
  scope = "PRIVATE"
  zone_name_or_id = oci_dns_zone.dnsz-au-com-sice-nzaukwktbos-cdschmidt-spoke03.id
}
*/
// ccarrillo - 20240627 - Adjustment using Iterative variable "dns_rrsets" for cration oci_dns_rrset
resource oci_dns_rrset dnsrrset-au-com-sice-nzaukwktbos-cdschmidt-spoke03-test_A {

    for_each = {
    for k, v in var.dns_rrsets : k => v
    if v.rrset == "dnsrrset-au-com-sice-nzaukwktbos-cdschmidt-spoke03-test_A"
    }

    compartment_id = var.compartment_ocid
    domain = each.value.domain
    items {
        domain = each.value.domain
        rdata  = each.value.rdata
        rtype  = each.value.rtype
        ttl    = each.value.ttl
    }
    rtype = each.value.rtype
    scope = each.value.scope
    zone_name_or_id = oci_dns_zone.dnsz-au-com-sice-nzaukwktbos-cdschmidt-spoke03.id
}
