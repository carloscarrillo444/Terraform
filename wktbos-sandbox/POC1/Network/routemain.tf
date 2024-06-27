resource "oci_core_route_table" "example" {
  compartment_id = var.compartment_ocid
  vcn_id         = var.vcn_ocid

  route_rules = [
    for rule in var.route_rules : {
      destination       = rule.destination
      destination_type  = rule.destination_type
      network_entity_id = rule.network_entity_id
    }
  ]

  display_name = "example-route-table"
}
