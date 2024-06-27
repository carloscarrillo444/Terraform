#Terraform script template to create OCI Autonomous Database. Replace the value for Dev/Test/PreProd and Prod if needed.
# Edwin Jardin  2024


provider "oci" {}

resource "oci_database_autonomous_database" "oci_database_autonomous_database" {
	admin_password = "changethispassword"
	autonomous_maintenance_schedule_type = "REGULAR"
	backup_retention_period_in_days = "60"
	character_set = "AL32UTF8"
	compartment_id = "ocid1.compartment.oc1..aaaaaaaapnl5xjh664hwyu6hvxtda2pcxqwg6ushxrsitf4wbawng2c65mna"
	compute_count = "2"
	compute_model = "ECPU"
	customer_contacts {
		email = "ejardin@sice.com.au"
	}
	data_storage_size_in_gb = "1024"
	database_edition = "STANDARD_EDITION"
	db_name = "WKTSDBTest"
	db_tools_details {
		is_enabled = "true"
		name = "APEX"
	}
	db_tools_details {
		is_enabled = "true"
		name = "DATABASE_ACTIONS"
	}
	db_tools_details {
		compute_count = "2"
		is_enabled = "true"
		max_idle_time_in_minutes = "240"
		name = "GRAPH_STUDIO"
	}
	db_tools_details {
		compute_count = "2"
		is_enabled = "true"
		max_idle_time_in_minutes = "60"
		name = "OML"
	}
	db_tools_details {
		compute_count = "2"
		is_enabled = "true"
		max_idle_time_in_minutes = "10"
		name = "DATA_TRANSFORMS"
	}
	db_tools_details {
		is_enabled = "true"
		name = "ORDS"
	}
	db_tools_details {
		is_enabled = "false"
		name = "MONGODB_API"
	}
	db_version = "19c"
	db_workload = "OLTP"
	display_name = "WKTSDBTest"
	is_auto_scaling_enabled = "true"
	is_auto_scaling_for_storage_enabled = "false"
	is_dedicated = "false"
	is_mtls_connection_required = "true"
	is_preview_version_with_service_terms_accepted = "false"
	license_model = "BRING_YOUR_OWN_LICENSE"
	ncharacter_set = "AL16UTF16"
}
