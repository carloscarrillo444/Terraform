variable "tenancy_ocid" {}
variable "region" {}
variable "availability_domain" {}
variable "compartment_ocid" {  
    default = "ocid1.compartment.oc1..aaaaaaaa6ocrtuflscgbd3h4ripc5iiyj72l2a73hzfbkvk7rowuni52nuwq"
}

variable "desktop_pool_id" {
    default = "desktop-pool-test"
}
variable "desktop_shape" {
    default="VM.Standard2.1"
}
variable "desktop_image_id" {
    default="ocid1.image.oc1.ap-melbourne-1.aaaaaaaaeizgpef7bprvunndgqddzc6hs5i6n7niuc7g33boekho5ssnburq"
}
variable "desktops_subnet_id" {
    default="ocid1.subnet.oc1.ap-melbourne-1.aaaaaaaawabq2cotzu4iztqwxhbtschthl7gkngf6jz2cbjzqfa5m47cyd5q"
}
variable "desktop_ocpus" {
    default = "1"
}
variable "desktop_memory" {
    default="16"
}
