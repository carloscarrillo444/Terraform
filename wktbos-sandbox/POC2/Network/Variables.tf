variable "region" {}      
variable "tenancy_ocid" {}
variable "compartment_ocid" {}

#drg variables
variable "poc2_drg_attachment_display_name" {
  default = "drga-mel-siceanz-tolling-poc2"
}
variable "drg_ocid" {
  default = "ocid1.drg.oc1.ap-melbourne-1.aaaaaaaau6kslrlkg4iffghukwfsl2rdrltg2nfsmpprpepzjh5nkcifetfq"
}

#vcn variables
variable "vcn_cidr_block" {
    default = "10.50.24.0/22"
}
variable "vcn_dns_label" {
    default = "poc2"
}
variable "vcn_display_name" {
    default = "vcn-mel-siceanz-tolling-poc2"
}

#subnet variables
variable "commercialportal_subnet_cidr" {
    default = "10.50.24.0/27"
}
variable "commercialportal_display_name" {
    default = "sn-mel-siceanz-tolling-poc2-commercialportal-priv"
}
variable "operationalportal_subnet_cidr" {
    default = "10.50.24.32/27"  
}
variable "operationalportal_display_name" {
    default = "sn-mel-siceanz-tolling-poc2-operationalportal-priv"  
}
variable "externalinterface_subnet_cidr" {
    default = "10.50.24.64/27"  
}
variable "externalinterface_display_name" {
    default = "sn-mel-siceanz-tolling-poc2-externalinterface-priv"  
}
variable "commercialapp_subnet_cidr"{
    default = "10.50.24.96/27"
}
variable "commercialapp_display_name"{
    default = "sn-mel-siceanz-tolling-poc2-commercialapp-priv"
}
variable "opertionalapp_subnet_cidr"{
    default = "10.50.24.128/27"
}
variable "opertionalapp_display_name"{
    default = "sn-mel-siceanz-tolling-poc2-operationalapp-priv"
}
variable "database_subnet_cidr"{
    default = "10.50.24.160/27"
}
variable "database_display_name"{
    default = "sn-mel-siceanz-tolling-poc2-database-priv"
}

#routing variables
variable "routing_mgmt_description"{
    default = "Access to SICEANZ management VCN"
}
variable "routing_mgmt_cidr"{
    default = "10.50.0.0/20"
}
variable "routing_ss_description"{
    default = "Access to SICEANZ Shared Services VCN"
}
variable "routing_ss_cidr" {
  default = "10.50.16.0/22"
}