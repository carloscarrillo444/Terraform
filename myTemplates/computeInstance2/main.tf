provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

resource "oci_core_vcn" "vcn" {
  cidr_block     = var.vcn_cidr
  compartment_id = var.compartment_id
  display_name   = "terraform-vcn"
}

resource "oci_core_subnet" "subnet" {
  cidr_block        = var.subnet_cidr
  display_name      = "terraform-subnet"
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_vcn.vcn.id
  route_table_id    = oci_core_route_table.route_table.id
  security_list_ids = [oci_core_security_list.security_list.id]
}

resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = var.compartment_id
  display_name   = "terraform-internet-gateway"
  vcn_id         = oci_core_vcn.vcn.id
}

resource "oci_core_route_table" "route_table" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "terraform-route-table"

  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
  }
}

resource "oci_core_security_list" "security_list" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "terraform-security-list"

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "22"
      min = "22"
    }
  }
}

resource "oci_core_instance" "vm_instance" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  display_name        = "terraform-instance"
  shape               = var.instance_shape

  shape_config {
    ocpus         = var.instance_ocpus
    memory_in_gbs = var.instance_memory_in_gbs
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.subnet.id
    assign_public_ip = true
    private_ip       = var.instance_private_ip
  }

  source_details {
    source_type = "image"
    source_id   = var.image_id
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key_path)
  }
}

resource "oci_core_volume" "block_volume" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  display_name        = "terraform-block-volume"
  size_in_gbs         = var.block_volume_size_in_gbs
}

resource "oci_core_volume_attachment" "block_volume_attachment" {
  attachment_type = "paravirtualized"
  instance_id     = oci_core_instance.vm_instance.id
  volume_id       = oci_core_volume.block_volume.id
}