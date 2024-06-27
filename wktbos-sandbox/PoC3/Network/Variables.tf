variable "region" {}      
variable "tenancy_ocid" {}
variable "cmp_network" {
    default = "ocid1.compartment.oc1..aaaaaaaawic6ndwdeloznwpphrnme4jvxxw3ognjhyrm564kohd3dg43tzla"
}

#drg variables
variable "drg_attachment_display_name" {
  default = "drga-mel-siceanz-tolling-poc3"
}
variable "drg_ocid" {
  default = "ocid1.drg.oc1.ap-melbourne-1.aaaaaaaau6kslrlkg4iffghukwfsl2rdrltg2nfsmpprpepzjh5nkcifetfq"
}
variable "drgrd_ss_import" {
    default = "ocid1.drgroutedistribution.oc1.ap-melbourne-1.aaaaaaaacmjfjvhhivn7tkjuurw2rgygybwbv4zccxo24ysqs6xy6wejlr4q"
}
variable "drgrt_spokeingress" {
    default = "ocid1.drgroutetable.oc1.ap-melbourne-1.aaaaaaaapzvwhjcz76wznwvemqqyt6qxz6j6d64cnxqw5qir2rfju2q5r73a"
}

#vcn variables
variable "vcn_cidr_block" {
    default = "10.50.28.0/22"
}
variable "vcn_dns_label" {
    default = "poc3"
}
variable "vcn_display_name" {
    default = "vcn-mel-siceanz-tolling-poc3"
}

variable "vcn_mgmt_cidr_block"{
    default = "10.50.0.0/20"
}

#subnet variables
variable "dmz_subnet_cidr" {
    default = "10.50.28.0/27"
}
variable "dmz_display_name" {
    default = "sn-mel-siceanz-tolling-poc3-dmz-priv"
}
variable "commercialportal_subnet_cidr" {
    default = "10.50.28.32/27"
}
variable "commercialportal_display_name" {
    default = "sn-mel-siceanz-tolling-poc3-commercialportal-priv"
}
variable "operationalportal_subnet_cidr" {
    default = "10.50.28.64/27"  
}
variable "operationalportal_display_name" {
    default = "sn-mel-siceanz-tolling-poc3-operationalportal-priv"  
}
variable "externalinterface_subnet_cidr" {
    default = "10.50.28.96/27"  
}
variable "externalinterface_display_name" {
    default = "sn-mel-siceanz-tolling-poc3-externalinterface-priv"  
}
variable "commercialapp_subnet_cidr"{
    default = "10.50.28.128/27"
}
variable "commercialapp_display_name"{
    default = "sn-mel-siceanz-tolling-poc3-commercialapp-priv"
}
variable "opertionalapp_subnet_cidr"{
    default = "10.50.28.160/27"
}
variable "opertionalapp_display_name"{
    default = "sn-mel-siceanz-tolling-poc3-operationalapp-priv"
}
variable "database_subnet_cidr"{
    default = "10.50.28.192/27"
}
variable "database_display_name"{
    default = "sn-mel-siceanz-tolling-poc3-database-priv"
}