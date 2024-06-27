variable "region" {}      
variable "tenancy_ocid" {}
variable "compartment_ocid" {}


variable "drg_display_name" {
  default = "drg-mel-siceanz-tolling-sandbox-cdschmidt"
}
variable "drg_hub_attachment_display_name" {
  default = "drga-mel-siceanz-tolling-sandbox-cdschmidt-hub"
}
variable "drg_spoke01_attachment_display_name" {
  default = "drga-mel-siceanz-tolling-sandbox-cdschmidt-spoke01"
}
variable "drg_spoke02_attachment_display_name" {
  default = "drga-mel-siceanz-tolling-sandbox-cdschmidt-spoke02"
}
variable "drg_spoke03_attachment_display_name" {
  default = "drga-mel-siceanz-tolling-sandbox-cdschmidt-spoke03"
}

# hub
variable "hub_vcn_cidr_block" {
  default = "10.50.240.0/24"
}
variable "hub_vcn_dns_label" {
  default = "hubvcn"
}
variable "hub_vcn_display_name" {
  default = "vcn-mel-siceanz-tolling-sandbox-cdschmidt-hub"
}
variable "hub_dns_priv_cidr_block" {
  default = "10.50.240.0/29"
}
variable "hub_dns_priv_display_name" {
  default = "sn-mel-siceanz-tolling-sandbox-cdschmidt-hub-dns-priv"
}
variable "hub_dmz_priv_cidr_block" {
  default = "10.50.240.32/27"
}
variable "hub_dmz_priv_display_name" {
  default = "sn-mel-siceanz-tolling-sandbox-cdschmidt-hub-dmz-priv"
}

# spoke01 (mgmt)
variable "spoke01_vcn_cidr_block" {
  default = "10.50.241.0/24"
}
variable "spoke01_vcn_dns_label" {
  default = "spoke01vcn"
}
variable "spoke01_vcn_display_name" {
  default = "vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01"
}
## dns
variable "spoke01_dns_priv_cidr_block" {
  default = "10.50.241.0/29"
}
variable "spoke01_dns_priv_display_name" {
  default = "sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-dns-priv"
}
variable "spoke01_dns_listener_ip" {
  default = "10.50.241.2"
}
variable "spoke01_dns_forwarder_ip" {
  default = "10.50.241.4"
}
## allaccess
variable "spoke01_allaccess_priv_cidr_block" {
  default = "10.50.241.32/27"
}
variable "spoke01_allaccess_priv_dns_label" {
  default = "allaccess"
}
variable "spoke01_allaccess_priv_display_name" {
  default = "sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-allaccess-priv"
}
## spoke02access
variable "spoke01_spoke02access_priv_cidr_block" {
  default = "10.50.241.64/27"
}
variable "spoke01_spoke02access_priv_dns_label" {
  default = "spoke02access"
}
variable "spoke01_spoke02access_priv_display_name" {
  default = "sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-spoke02access-priv"
}
## spoke03access
variable "spoke01_spoke03access_priv_cidr_block" {
  default = "10.50.241.96/27"
}
variable "spoke01_spoke03access_priv_dns_label" {
  default = "spoke03access"
}
variable "spoke01_spoke03access_priv_display_name" {
  default = "sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-spoke03access-priv"
}

# spoke02
variable "spoke02_vcn_cidr_block" {
  default = "10.50.242.0/24"
}
variable "spoke02_vcn_dns_label" {
  default = "spoke02vcn"
}
variable "spoke02_vcn_display_name" {
  default = "vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke02"
}
## dns
variable "spoke02_dns_priv_cidr_block" {
  default = "10.50.242.0/29"
}
variable "spoke02_dns_priv_display_name" {
  default = "sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke02-dns-priv"
}
variable "spoke02_dns_listener_ip" {
  default = "10.50.242.2"
}
variable "spoke02_dns_forwarder_ip" {
  default = "10.50.242.4"
}
## app
variable "spoke02_app_priv_cidr_block" {
  default = "10.50.242.32/27"
}
## app
variable "spoke02_app_priv_dns_label" {
  default = "app"
}
variable "spoke02_app_priv_display_name" {
  default = "sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke02-app-priv"
}
## db
variable "spoke02_db_priv_cidr_block" {
  default = "10.50.242.64/27"
}
variable "spoke02_db_priv_dns_label" {
  default = "db"
}
variable "spoke02_db_priv_display_name" {
  default = "sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke02-db-priv"
}
# spoke03
variable "spoke03_vcn_cidr_block" {
  default = "10.50.243.0/24"
}
variable "spoke03_vcn_dns_label" {
  default = "spoke03vcn"
}
variable "spoke03_vcn_display_name" {
  default = "vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03"
}
## dns
variable "spoke03_dns_priv_cidr_block" {
  default = "10.50.243.0/29"
}
variable "spoke03_dns_priv_display_name" {
  default = "sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03-dns-priv"
}
variable "spoke03_dns_listener_ip" {
  default = "10.50.243.2"
}
variable "spoke03_dns_forwarder_ip" {
  default = "10.50.243.4"
}
## app
variable "spoke03_app_priv_cidr_block" {
  default = "10.50.243.32/27"
}
variable "spoke03_app_priv_dns_label" {
  default = "app"
}
variable "spoke03_app_priv_display_name" {
  default = "sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03-app-priv"
}
## db
variable "spoke03_db_priv_cidr_block" {
  default = "10.50.243.64/27"
}
variable "spoke03_db_priv_dns_label" {
  default = "db"
}
variable "spoke03_db_priv_display_name" {
  default = "sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03-db-priv"
}

// ccarrillo - 20240627 - Iterative variable "dns_rrsets" for resources spoke01|spoke02|spoke03/oci_dns_rrset dnsrrset-au-com-sice-nzaukwktbos-cdschmidt-spokeXX-test_A 
variable "dns_rrsets" {
  type = map(object({
    rrset   = string
    domain  = string
    rdata   = string
    rtype   = string
    ttl     = string
    scope   = string
  }))
  default = {
    dns_rrset01 = { rrset = "dnsrrset-au-com-sice-nzaukwktbos-cdschmidt-spoke03-test_A", domain = "test.spoke03.cdschmidt.nzaukwktbos.sice.com.au", rdata = "9.10.11.12" , rtype = "A", ttl = "3600", scope = "PRIVATE" },
    dns_rrset02 = { rrset = "dnsrrset-au-com-sice-nzaukwktbos-cdschmidt-spoke02-test_A", domain = "test.spoke02.cdschmidt.nzaukwktbos.sice.com.au", rdata = "5.6.7.8" , rtype = "A", ttl = "3600", scope = "PRIVATE" },
    dns_rrset03 = { rrset = "dnsrrset-au-com-sice-nzaukwktbos-cdschmidt-spoke01-test_A", domain = "test.spoke01.cdschmidt.nzaukwktbos.sice.com.au", rdata = "1.2.3.4" , rtype = "A", ttl = "3600", scope = "PRIVATE" }
  }
}
