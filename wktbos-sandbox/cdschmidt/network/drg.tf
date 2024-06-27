resource "oci_core_drg" "drg-mel-siceanz-tolling-sandbox-cdschmidt" {
    compartment_id = var.compartment_ocid
    display_name = var.drg_display_name
}
resource "oci_core_drg_attachment" "drga-mel-siceanz-tolling-sandbox-cdschmidt-hub" {
    drg_id = oci_core_drg.drg-mel-siceanz-tolling-sandbox-cdschmidt.id
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-hub.id
    display_name = var.drg_hub_attachment_display_name
}
resource "oci_core_drg_attachment" "drga-mel-siceanz-tolling-sandbox-cdschmidt-spoke01" {
    drg_id = oci_core_drg.drg-mel-siceanz-tolling-sandbox-cdschmidt.id
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01.id
    display_name = var.drg_spoke01_attachment_display_name
}
resource "oci_core_drg_attachment" "drga-mel-siceanz-tolling-sandbox-cdschmidt-spoke02" {
    drg_id = oci_core_drg.drg-mel-siceanz-tolling-sandbox-cdschmidt.id
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke02.id
    display_name = var.drg_spoke02_attachment_display_name
}
resource "oci_core_drg_attachment" "drga-mel-siceanz-tolling-sandbox-cdschmidt-spoke03" {
    drg_id = oci_core_drg.drg-mel-siceanz-tolling-sandbox-cdschmidt.id
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03.id
    display_name = var.drg_spoke03_attachment_display_name
}