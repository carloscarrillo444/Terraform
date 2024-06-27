resource "oci_core_instance" "hardened_instance" {
  compartment_id       = var.compartment_ocid
  availability_domain  = data.oci_identity_availability_domains.ADs.availability_domains[0].name
  shape                = "VM.Standard2.1"

  create_vnic_details {
    subnet_id      = oci_core_subnet.main_subnet.id
    assign_public_ip = true
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key)
    user_data = base64encode(file("scripts/harden_instance.sh"))
  }

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.OracleLinux.image_id
  }

  display_name = "hardened-instance"
}

