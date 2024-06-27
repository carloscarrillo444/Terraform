
# The common configuration for all desktops in the pool
resource "oci_core_instance_configuration" "desktop_instance_configuration" {

  # The compartment where the instance config will be created
  compartment_id      = var.compartment_ocid

  defined_tags = {}
  display_name = "desktop_configuration_${var.desktop_pool_id}"
  freeform_tags = {
    "oci:desktops:pool" = var.desktop_pool_id
  }

  instance_details {
    
    instance_type = "compute"

    launch_details {

      availability_domain = var.availability_domain

      # The compartment where the desktop instances will be created
      compartment_id      = var.compartment_ocid

      shape = var.desktop_shape

      # Dynamically add 'shape_config' for Flex options
      dynamic "shape_config" {
        for_each = length(regexall("Flex", var.desktop_shape )) > 0 ? [1] : []
        content {
          ocpus = var.desktop_ocpus
          memory_in_gbs = var.desktop_memory
        }
      }

      source_details {
        source_type = "image"
        image_id   = var.desktop_image_id
      }

      create_vnic_details {
        assign_public_ip       = "false"
        skip_source_dest_check = "false"
        subnet_id              = var.desktops_subnet_id
      }

      agent_config {
        is_management_disabled = "false"
        is_monitoring_disabled = "false"
      }
    }
  }
}
