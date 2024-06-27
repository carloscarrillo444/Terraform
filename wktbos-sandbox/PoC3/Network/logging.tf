# Logging groups
## SICEANZ tolling ss subnet logs
resource oci_logging_log_group lg-siceanz-tolling-poc3-subnets {
  compartment_id = var.cmp_network
  description  = "Log group for SICEANZ tolling poc3 subnet logs"
  display_name = "lg-siceanz-tolling-poc3-subnets"
}

## POC3 database sn
resource oci_logging_log log_sn_siceanz_tolling_poc3_database_priv_all {
  configuration {
    compartment_id = var.cmp_network
    source {
      category = "all"
      parameters = {
      }
      resource    = oci_core_subnet.sn-mel-siceanz-tolling-poc3-database-priv.id
      service     = "flowlogs"
      source_type = "OCISERVICE"
    }
  }
  display_name = "log_sn_siceanz_tolling_poc3_database_priv_all"
  is_enabled         = "true"
  log_group_id       = oci_logging_log_group.lg-siceanz-tolling-poc3-subnets.id
  log_type           = "SERVICE"
  retention_duration = "30"
}
## POC3 externalinterface sn
resource oci_logging_log log_sn_siceanz_tolling_poc3_externalinterface_priv_all {
  configuration {
    compartment_id = var.cmp_network
    source {
      category = "all"
      parameters = {
      }
      resource    = oci_core_subnet.sn-mel-siceanz-tolling-poc3-externalinterface-priv.id
      service     = "flowlogs"
      source_type = "OCISERVICE"
    }
  }
  display_name = "log_sn_siceanz_tolling_poc3_externalinterface_priv_all"
  is_enabled         = "true"
  log_group_id       = oci_logging_log_group.lg-siceanz-tolling-poc3-subnets.id
  log_type           = "SERVICE"
  retention_duration = "30"
}
## POC3 externalinterface sn
resource oci_logging_log log_sn_siceanz_tolling_poc3_dmz_priv_all {
  configuration {
    compartment_id = var.cmp_network
    source {
      category = "all"
      parameters = {
      }
      resource    = oci_core_subnet.sn-mel-siceanz-tolling-poc3-dmz-priv.id
      service     = "flowlogs"
      source_type = "OCISERVICE"
    }
  }
  display_name = "log_sn_siceanz_tolling_poc3_dmz_priv_all"
  is_enabled         = "true"
  log_group_id       = oci_logging_log_group.lg-siceanz-tolling-poc3-subnets.id
  log_type           = "SERVICE"
  retention_duration = "30"
}