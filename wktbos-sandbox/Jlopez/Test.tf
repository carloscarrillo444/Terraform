provider "oci" {}
#Create standard VCN for 
resource "oci_core_vcn" "testvcn" {
  cidr_blocks     = ["10.60.20.0/24"]
  compartment_id = var.compartment_ocid
  display_name   = "test VCN"
  dns_label      = "testvcn"
  is_ipv6enabled = "false"
}

#Create below subnets for above VCN
resource "oci_core_subnet" "testsubnet" {
  cidr_block          = "10.60.20.0/27"
  compartment_id = var.compartment_ocid
  display_name        = "test subnet"
  vcn_id              = oci_core_vcn.testvcn.id
  prohibit_internet_ingress  = "true"
	prohibit_public_ip_on_vnic = "true"
}










