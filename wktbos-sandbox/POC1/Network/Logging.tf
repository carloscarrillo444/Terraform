# Create Log Group
resource "oci_logging_log_group" "example_log_group" {
  compartment_id = "<COMPARTMENT_OCID>"
  display_name   = "example-log-group"
  description    = "Log group for storing logs"
}

# Create Logs within the Log Group
resource "oci_logging_log" "wktbos_log" {
  log_group_id   = oci_logging_log_group.wktbos_log_group.id
  display_name   = "wktbos-log"
  log_type       = "CUSTOM" # Change this to the desired log type (e.g., CUSTOM, SERVICE, AUDIT)
  description    = "This is an example log"
  is_enabled     = true

  configuration {
    retention_duration = 30 # Number of days to retain logs
  }
}

# Example Log Configuration for Audit Logs (if needed)
resource "oci_logging_log" "audit_log" {
  log_group_id   = oci_logging_log_group.example_log_group.id
  display_name   = "audit-log"
  log_type       = "AUDIT"
  description    = "Audit log"
  is_enabled     = true

  configuration {
    retention_duration = 90 # Number of days to retain audit logs
  }
}

# Define IAM Policy for Logging (if needed)
resource "oci_identity_policy" "logging_policy" {
  compartment_id = "<COMPARTMENT_OCID>"
  name           = "logging-policy"
  description    = "Policy for allowing logging"
  statements = [
    "Allow service loganalytics to read metrics in compartment <COMPARTMENT_NAME>",
    "Allow service loganalytics to read log-groups in compartment <COMPARTMENT_NAME>",
    "Allow service loganalytics to manage log-content in compartment <COMPARTMENT_NAME>",
    "Allow service loganalytics to use log-content in compartment <COMPARTMENT_NAME>"
  ]
}

# Create a Dynamic Group for Logging (if needed)
resource "oci_identity_dynamic_group" "logging_dynamic_group" {
  compartment_id = "<COMPARTMENT_OCID>"
  name           = "logging-dynamic-group"
  description    = "Dynamic group for logging"
  matching_rule  = "ALL {resource.type = 'loganalytics'}"
}

# Attach a policy to the Dynamic Group
resource "oci_identity_policy" "dynamic_group_policy" {
  compartment_id = "<COMPARTMENT_OCID>"
  name           = "dynamic-group-policy"
  description    = "Policy for dynamic group"
  statements = [
    "Allow dynamic-group logging-dynamic-group to use log-groups in compartment <COMPARTMENT_NAME>",
    "Allow dynamic-group logging-dynamic-group to manage log-content in compartment <COMPARTMENT_NAME>"
  ]
}
