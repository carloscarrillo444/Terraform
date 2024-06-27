variable "region" {}      
variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "availability_domain"{
    default = "OdQD:AP-MELBOURNE-1-AD-1"
}
variable "BIS_public_portal_front_displayname" {
    default = "BIS Public Portal Frontend"
}
variable "BIS_internal_portal_front_displayname" {
    default = "BIS Internal Portal Frontend"
}
variable "linux_image"{
    default = "ocid1.image.oc1.ap-melbourne-1.aaaaaaaakgmjou3rbkltadterqxsyvmkuclwumjmaqqnr4hxxeeku3yzvj6q"
}