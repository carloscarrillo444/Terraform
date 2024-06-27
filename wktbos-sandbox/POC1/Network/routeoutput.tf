output "route_table_id" {
  value = oci_core_route_table.example.id
}

output "route_table_rules" {
  value = oci_core_route_table.example.route_rules
}
