data "oci_vulnerability_scanning_host_scan_target_errors" "test_host_scan_target_errors" {
    #Required
    compartment_id = "ocid1.compartment.oc1..aaaaaaaaar4g7m6svxn7dlz5wsalf6avfwt3y3h5h6otdzxb76lp4obrg7zq"
    host_scan_target_id = "uniquetestID"

    #Optional
    #state = var.host_scan_target_error_state
}