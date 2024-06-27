#
# Copyright (c) 2021, 2022, Oracle and/or its affiliates. 
#

provider "oci" {
    tenancy_ocid     = var.tenancy_ocid
    region           = var.region
    version          = ">= 4.50.0"
}
